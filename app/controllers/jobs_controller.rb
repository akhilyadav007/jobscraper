class JobsController < ApplicationController
  def index
    @jobs = []

    if session[:search_params].present?
      search_params_raw = session.delete(:search_params).symbolize_keys
      search_params = search_params_raw.merge(
        number_of_jobs: search_params_raw[:number_of_jobs].to_i,
        remote: search_params_raw[:remote] == '1',
        fun_bullet_point: '🦖',
        date_posted: search_params_raw[:date_posted],
        board_relevance: [
          'LinkedIn', 'Naukri', 'GoRails Jobs', 'Ruby On Remote', 'We Are Hiring', 'We Work Remotely'
        ]
      )

      scraper = Engine::Google::JobScraper.new(**search_params)
      @jobs = scraper.generate_job_list(write_to_file: false)
      Rails.cache.write("last_jobs_#{session.id}", @jobs, expires_in: 30.minutes)
    end
  end

  def search
    session[:search_params] = {
      job_title: params[:job_title],
      location: params[:location],
      remote: params[:remote],
      language_code: params[:language_code],
      number_of_jobs: params[:number_of_jobs],
      date_posted: params[:date_posted]
    }

    redirect_to root_path
  end

  def download
    jobs = Rails.cache.read("last_jobs_#{session.id}") || []

    if jobs.empty?
      redirect_to root_path, alert: "⚠️ No job results available to download. Please search first."
      return
    end

    job_list = jobs.map.with_index(1) do |j, index|
      "#{index}. #{j[:title]} at @#{j[:company]}: #{j[:link]}"
    end

    formatted_content = job_list.map { |line| "#{line}\r\n" }.join("\r\n")
    send_data formatted_content, filename: "jobs_list.txt", type: 'text/plain'
  end
end
