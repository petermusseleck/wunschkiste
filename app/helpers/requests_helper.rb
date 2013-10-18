# encoding: utf-8
module RequestsHelper

  def back_to_index_self
    link_to "Zurück zur Liste", own_requests_path
  end
  def back_to_select
    link_to "Zurück zur Auswahl", select_path
  end
  def back_to_admin
      link_to "Zurück zum Adminbereich", admin_path
  end
end
