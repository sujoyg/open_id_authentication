Rails.application.routes.draw do
  get 'open_id/accept' => 'open_id#accept', as: 'open_id_accept'
  get 'open_id/connect' => 'open_id#connect', as: 'open_id_connect'
end
