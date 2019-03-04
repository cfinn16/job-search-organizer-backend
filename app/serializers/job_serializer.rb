class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :company, :years_experience, :salary, :contact_email, :description, :current_column

  def current_column
    if self.object.user_jobs.length > 0
      @id = self.object.user_jobs.order("created_at").last.user_id
      self.object.user_jobs.where(user_id: @id).first.column
    else
      "Interested"
    end
  end

  has_many :tasks
end
