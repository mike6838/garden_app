module ApplicationHelper


	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Garden_App"
    if page_title.empty?
      base_title
    else
      "#{base_title} @_@ #{page_title}"
    end
  end
end

