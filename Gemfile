source 'https://rubygems.org'

gem "jekyll"

# The gem packages come from the system, e.g. Debian packages.  The
# gems from git should be referenced using a commit ID ref to provide
# a strong verified link to the source code.  The production site
# verifies a signed git tag, which then will include the SHA1 commit
# ID, which git will verify.
group :jekyll_plugins do
    gem "jekyll-redirect-from"
    gem "jekyll-paginate-v2"
    gem "jekyll-polyglot", :git => 'https://gitlab.com/fdroid/jekyll-polyglot.git',
        :ref => '0760eda11055862afab9e30e3fd9f44b4190d753'
    gem 'jekyll-fdroid', :git => 'https://gitlab.com/fdroid/jekyll-fdroid.git',
        :ref => '7f73a45d1a9be68c8a6af75396a3769799c9f79f'
    gem 'git'
end
