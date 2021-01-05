module ApplicationHelper

	def pluralize_without_count(count, noun, text = nil)
	  if count != 0
	    count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
	  end
	end

	def markdown(text)
	  options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode] 
	  Redcarpet.new(text, *options).to_html.html_safe
	end

	def days_until(event_date)
	  end_date = event_date.to_date
	  today = DateTime.now
	  # today = Date.new(now.year,now.month,now.day)
	  days_until = ( end_date - today ).to_i + 1
	end

	def title(page_title, show_title = true)
	  content_for(:title) { h(page_title.to_s) }
	  @show_title = show_title
	end

	def show_title?
	  @show_title
	end
end
