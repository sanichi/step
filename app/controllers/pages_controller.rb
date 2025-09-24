class PagesController < ApplicationController
  def env
    @passenger_version = `env -i /usr/bin/passenger-config --version`.scan(/\d+\.\d+\.\d+/).first if Rails.env.production?
    @puma_version = Puma::Const::VERSION if Rails.env.development?
    @gem_version = `gem -v`.rstrip
    @host = ENV["HOSTNAME"] || `hostname`.chop.sub(".local", "")
  end

  def image
    @image = Image.check(params[:year], params[:dim], params[:num])
    @next = @image.next
    @prev = @image.prev
  end
end
