module AdminUsersHelper
  def is_superadmin?(user)
    user == admin.id
  end
end
