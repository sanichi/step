class PagesController < ApplicationController
  def env
    @passenger_version = `passenger -v`
    @gem_version = `gem -v`.rstrip
    @host = ENV["HOSTNAME"] || `hostname`.chop.sub(".local", "")
  end

  def image
    @image = Image.check(params[:year], params[:dim], params[:num])
    @next = @image.next
    @prev = @image.prev
  end
end
