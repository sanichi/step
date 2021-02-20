Rails.application.routes.draw do
  root to: "pages#home"

  %w[about archive home image info register].each do |page|
    get page => "pages##{page}"
  end

  (2013..2020).each do |year|
    get "conference-#{year}" => "pages#conference_#{year}"
  end

  get "online-2021" => "pages#online_2021"
end
