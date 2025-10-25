class PagesController < ApplicationController
  def env
    sensitive_keys = %i[postgres user shell pwd path]
    @sys_info = Sni::SysInfo.call.except(*sensitive_keys)
  end

  def image
    @image = Image.check(params[:year], params[:dim], params[:num])
    @next = @image.next
    @prev = @image.prev
  end
end
