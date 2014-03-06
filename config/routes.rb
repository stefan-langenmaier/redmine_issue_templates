Rails.application.routes.draw do 
  match 'projects/:project_id/issue_templates/:action', :to => 'issue_templates'
  match 'projects/:project_id/issue_templates/:action/:id', :to => 'issue_templates#edit'
  match 'projects/:project_id/issue_templates/move/:id', :to => 'issue_templates#move_to'
  match 'projects/:project_id/issue_templates_settings/:action', :to => 'issue_templates_settings'
  match 'issue_templates', :to => 'issue_templates#global_index', :via => [:get]
  match 'issue_templates/:action', :to => 'issue_templates', :via => [:get]
  match 'issue_templates/global_new', :to => 'issue_templates#global_new', :via => [:get, :post]
  match 'issue_templates/:action/:id', :to => 'issue_templates#global_edit'
  match 'issue_templates/preview', :to => 'issue_templates#preview', :via => [:get, :post]
  match 'projects/:project_id/issue_templates_settings/preview', :to => 'issue_templates_settings#preview', :via => [:get, :post]
end