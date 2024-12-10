class PagesController < ApplicationController
  def env
    dirs = `ls /home/sanichi/.passenger/native_support 2>&1`
    vers = dirs.scan(/\d*\.\d*\.\d*/)
    @passenger_version = vers.any? ? vers.last : "not found"
    @gem_version = `gem -v`.rstrip
    @host = ENV["HOSTNAME"] || `hostname`.chop.sub(".local", "")
  end

  def image
    @image = Image.check(params[:year], params[:dim], params[:num])
    @next = @image.next
    @prev = @image.prev
  end
end
