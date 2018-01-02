#
# If a document title is a "." separated string, which matches an entry in the site.data hash, then it will be translated
# to the matching value.
#
Jekyll::Hooks.register :site, :post_read do |site|

  site.documents.each do |document|
    parse_title(document)
  end

end

def parse_title(document)

  site = document.site
  title = document.data["title"]

  # Title has at least one word, followed by a dot, followed by more words and dots.
  if (title =~ /^[\w\-]+\.[\w\-.]+$/) == nil
    return
  end

  title_parts = title.split(/\./)
  new_title = recursively_get_value(site.data, title_parts)

  if new_title != nil and new_title.length > 0
    Jekyll::logger.debug "i18n", "Translating document title #{title} to #{site.active_lang}: \"#{new_title}\""
    document.data["title"] = new_title
  end

end

#
# Data is a hash with string keys, and each value is either another hash, or a string value, e.g:
#
# { "one" => { "two" => "Two"} }
#
# Keys is an array of strings, which represent successive indexes into the data hash, e.g:
#
# [ "one", "two" ]
#
# Will recursively search the data hash for a matching key, then return that value, or nil if not found.
#
def recursively_get_value(data, keys)
  key = keys[0]
  if data != nil and data.key? key
    if data[key].is_a? String
      if keys.length == 1
        return data[key]
      else
        return nil
      end
    else
      return recursively_get_value(data[key], keys[1..keys.length])
    end
  end
end