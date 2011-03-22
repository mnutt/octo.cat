require 'shortener'

class Url < ActiveRecord::Base
  before_validation :check_for_repo
  before_validation :set_short

  def self.create_from_url(url)
    uri = URI::parse(url)

    return unless uri.kind_of? URI::HTTP or uri.kind_of? URI::HTTPS

    url = Url.where(:url => url).first

    if url.nil?
      self.create(:url => url)
    end
  end

  def set_short
    last_record = Url.order('id desc').first
    next_id = last_record.nil? ? 1 : last_record.id + 1

    self.short = Shortener.encode(next_id)
  end

  def check_for_repo
    self.url.gsub!(/^http:\/\/github.com/, 'https://github.com')

    self.is_repo = true if self.url =~ /^https:\/\/github.com\/[A-Za-z0-9\-\.]+\/[A-Za-z0-9\_\.]+\/?$/
  end
end
