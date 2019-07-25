module ApplicationHelper

	def title

		divider_site_title = " | "
		base_site_title = t("site_name")

		if content_for?(:title)
		  # allows the title to be set in the view by using t(".title")
		  content_for :title

		else
		  # look up translation key based on controller path, action name and .title
		  # this works identical to the built-in lazy lookup
		  t("#{ controller_path.tr('/', '.') }.#{ action_name }.title", default: "") + divider_site_title + base_site_title
		end
	end

end
