require 'shortener'

class Url < ActiveRecord::Base
  before_validation :check_for_repo
  before_validation :set_short

  def self.create_from_url(u)
    u = normalize(u)
    uri = URI::parse(u)

    return unless uri.kind_of? URI::HTTP or uri.kind_of? URI::HTTPS

    url = Url.where(:url => u).first

    if url.nil?
      url = self.create(:url => u)
    end

    url
  end

  def self.normalize(u)
    # downcase
    u.sub!(/^http/i, 'http')

    # add http if it wasn't there
    u = "http://#{u}" unless u =~ /^http:\/\//

    # github is always https now, no need for an extra redirect
    u.sub!(/^http:\/\/github.com/, 'https://github.com')

    u
  end

  def set_short
    last_record = Url.order('id desc').first
    next_id = last_record.nil? ? 1 : last_record.id + 1

    self.short = Shortener.encode(next_id)
  end

  def check_for_repo
    self.is_repo = true if self.url =~ /^https:\/\/github.com\/[A-Za-z0-9\-\.]+\/[A-Za-z0-9\_\.]+\/?$/
  end

  def optimized_url
    self.is_repo? ? self.url.sub(/^https:\/\/github.com/, '') : self.url
  end
end
