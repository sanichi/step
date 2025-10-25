class PagesController < ApplicationController
  def env
    @sys_info = Sni::SysInfo.call
  end

  def image
    @image = Image.check(params[:year], params[:dim], params[:num])
    @next = @image.next
    @prev = @image.prev
  end
end
