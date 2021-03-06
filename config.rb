###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes
activate :i18n
activate :asset_hash
activate :minify_html

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
page "/admin/login.html", layout: :admin

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :blog do |blog|
   blog.name = "myblog"
  # This will add a prefix to all links, template references and source paths
   blog.prefix = "myblog"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
   blog.sources = "{year}-{month}-{day}-{title}.html"
   blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
   blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
   blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

#fix 2 blogs http://billyfung.com/blog/2017/01/middleman-blogs/
=begin
=end
activate :blog do |blog|
  blog.name = "catalog"
  blog.prefix = "catalog"
end



["tom", "dick", "harry"].each do |name|
  proxy "/about/#{name}.html", "/about/template.html", :locals => { :person_name => name }#, :ignore => true
end

data.work.projects.each do |project|
  proxy "/work/#{project.slug}.html", "/work/project.html", :locals => { :project => project }, :ignore => true
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
   activate :minify_css

  # Minify Javascript on build
   activate :minify_javascript

   config[:host] = "http://www.example.com" 
end
