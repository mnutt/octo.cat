class Repo
  def initialize(user_name, repo_name)
    @user_name = user_name
    @repo_name = repo_name
  end

  delegate :name, :user, :owner, :description, :to => :remote_repo

  def exists?
    !!remote_repo
  rescue
    false
  end

  def remote_repo
    @_remote_repo ||= Octokit.repository(repo_path)
  end

  def repo_path
    "#{@user_name}/#{@repo_name}"
  end

  def readme_path
    readme_info.first
  end

  def readme_sha
    readme_info.last
  end

  def readme
    @_readme ||= Octokit.raw(repo_path, readme_sha)
  end

  def rendered_readme
    @_rendered_readme ||= GitHub::Markup.render(readme_path, readme).html_safe
  end

  def marked_up?
    GitHub::Markup.can_render? readme_path
  end

  protected

  def readme_info
    @_readme_info ||= Octokit.blobs(repo_path, 'master').select{|k, v| k =~ /^readme/i}.last
  end

end
