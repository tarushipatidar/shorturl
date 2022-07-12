class ShortUrlController < ApplicationController

  def index
    @all_short_urls = ShortUrlData.all
  end

  def new; end

  def show
    data = ShortUrlData.where(short_url: params[:token]).try(:first)

    if data.present?
      if data.expiry_date < DateTime.now
        render file: "#{Rails.root}/public/404.html", layout: false, status: 404
      else
        data.update(url_open_count: data.try(:url_open_count).to_i + 1)
        # byebug
        unless TrackShortUrl.where(short_url_data_id: data.try(:id), id_addr: request.remote_ip).present?
          TrackShortUrl.create(short_url_data_id: data.try(:id), id_addr: request.remote_ip)
        end
        redirect_to data.real_url, allow_other_host: true
      end
    else
      redirect_to root_url
    end
  end

  def create
    real_url = params[:real_url]
    if real_url.present?
      random_str = [*('a'..'z'),*('0'..'9')].flat_map { |ranger| [ranger] * 5 }.shuffle[0,5].join # Get 5 random alpha-numeric characters
      # checking for same random string in database
      while ShortUrlData.where(short_url: random_str) != []
        random_str = [*('a'..'z'),*('0'..'9')].flat_map { |ranger| [ranger] * 5 }.shuffle[0,5].join
      end

      data = ShortUrlData.where(real_url: real_url).try(:first)
      if data.present?
        @new_data = data
      else
        expiry_date = DateTime.now + 30.days
        @new_data = ShortUrlData.create(real_url: real_url, short_url: random_str, expiry_date: expiry_date)

        if @new_data.errors.any?
          @error = @new_data.errors.messages.to_s
        else
          @msg = 'Url Short Successfully'
        end
      end
    else
      @error = 'Please enter an url'
    end
  end
end
