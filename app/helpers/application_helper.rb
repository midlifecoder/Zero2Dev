module ApplicationHelper


  def set_name_link

    case controller_name
      when "resources"
        {name_new: "ADD NEW POST",
        link_new: new_resource_path}
      when "projects"
        {name_new: "ADD NEW PROJECT",
        link_new: new_project_path}
      when "collaborations"
        {name_new: "ADD NEW REQUEST",
        link_new: new_collaboration_path}
      when "jobs"
        {name_new: "ADD NEW POST",
        link_new: new_job_path}
    end
  end

  # select all technologies tags for all Models
  def all_technologies_list
    ActsAsTaggableOn::Tagging.includes(:tag).where(context: 'technologies').map{|tagging| tagging.tag.name}.uniq.sort_by!(&:downcase)
  end

  # select all technologies tags for each Model type, and maps them to array
  # request done with 'squeel' gem
  def all_technologies_list_for_type
    case controller_name
      when "resources"
        @model = "Resource"
      when "projects"
        @model = "Project"
      when "collaborations"
        @model = "Collaboration"
      when "jobs"
        @model = "Job"
    end
    #need local variable for squeel to work
    model = @model
    ActsAsTaggableOn::Tagging.includes(:tag).where{(taggable_type == model) & (context == 'technologies')}.map{|tagging| tagging.tag.name}.uniq.sort_by!(&:downcase)
  end


end
