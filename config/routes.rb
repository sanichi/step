Rails.application.routes.draw do
  root to: "pages#home"

  %w[about env archive home image info register stepcast].each do |page|
    get page => "pages##{page}"
  end

  ((2013..2020).to_a + [2023, 2024]).each do |year|
    get "conference-#{year}" => "pages#conference_#{year}"
  end

  (2021..2022).each do |year|
    get "online-#{year}" => "pages#online_#{year}"
  end
end
