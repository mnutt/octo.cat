class RepositoriesController < ApplicationController
  def show
    repo_path = "#{params[:user]}/#{params[:repo]}"
    @repo = Octokit.repository(repo_path)
    readme_path, readme_sha = Octokit.blobs(repo_path, 'master').find{|k, v| k =~ /^readme/i}
    @readme = GitHub::Markup.render(File.basename(readme_path), Octokit.raw(repo_path, readme_sha)).html_safe
  end

  def watch
  end
end
