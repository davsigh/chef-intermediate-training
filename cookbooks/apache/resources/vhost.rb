# To learn more about Custom Resources, see https://docs.chef.io/custom_resources/
property :site_name, String
action :create do
  directory "/srv/apache/#{new_resource.site_name}/html" do
    recursive true
    mode '0755'
  end
  template "#{node['apache']['conf_dir']}/#{new_resource.site_name}.conf" do
    source 'conf.erb'
    mode '0644'
    variables(document_root: "/srv/apache/#{new_resource.site_name}/html", port: 8080)
  end
  file "/srv/apache/#{new_resource.site_name}/html/index.html" do
    content "Welcome #{new_resource.site_name}"
  end
end
