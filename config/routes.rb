Rails.application.routes.draw do
  root to: "pages#home"

  %w[about archive home info register].each do |page|
    get page => "pages##{page}"
  end
end
