ActiveAdmin.register_page "Dashboard" do
#controller.authorize_resource
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span ("Welcome to the dashboard! :)")
       # small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
       column do
         panel "Approved Exams" do
           ul do
             exams=Exam.approved.newest
             exams.each do |exam|
              li link_to(exam.title, admin_exam_path(exam))
             end
           end
         end

         panel "Approved Notifications" do
           ul do
             Notification.approved.newest.each do |notification|
              li link_to(notification.title, admin_notification_path(notification))
             end
           end
         end

         panel "Approved Articles" do
           ul do
             Article.approved.newest.each do |article|
              li link_to(article.title, admin_article_path(article))
             end
           end
         end

       end


       column do
         panel "Pending Exams" do
           ul do
             Exam.pending.newest.each do |exam|
              li link_to(exam.title, admin_exam_path(exam))
             end
           end
         end
         panel "Pending Notifications" do
           ul do
             Notification.pending.newest.each do |notification|
              li link_to(notification.title, admin_notification_path(notification))
             end
           end
         end

         panel "Pending Articles" do
           ul do
             Article.pending.newest.each do |article|
              li link_to(article.title, admin_article_path(article))
             end
           end
         end

       end
     end
  end # content
end
