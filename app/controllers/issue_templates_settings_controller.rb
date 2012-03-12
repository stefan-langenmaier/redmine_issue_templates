class IssueTemplatesSettingsController < ApplicationController
  unloadable
  before_filter :find_project, :find_user
  before_filter :authorize, :except => [ :show_help, :preview ]

  def edit
    if (params[:settings] != nil)
      @issue_templates_setting = IssueTemplateSetting.find_or_create(@project.id)
      @issue_templates_setting.attributes = params[:settings]
      @issue_templates_setting.save!
      flash[:notice] = l(:notice_successful_update)
      redirect_to :controller => 'projects', 
        :action => "settings", :id => @project, :tab => 'issue_templates'
    end
  end
  
  def preview
    @text = params[:settings][:help_message]
    render :partial => 'common/preview'
  end  

  private
  def find_user
    @user = User.current
  end
  
  def find_project
    begin
      @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      render_404
    end
  end  

end
