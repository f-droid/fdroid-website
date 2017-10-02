#
# Helper tag to find the correct screenshot based on the sites language.
# Will attempt to match just the language code (without region) if the more specific locale can't be found.
# If no matching screenshot if found, a warning message is logged and it falls back to "en".
#
module Jekyll
  class FDroidScreenshot < Liquid::Tag
    def render(context)
      site = context.registers[:site]
      site_source = site.config['source']
      active_lang = site.active_lang
      lang_without_region = just_lang(active_lang)

      preferred_path = "assets/fdroid-screenshot-#{active_lang}.png"
      acceptable_path = if lang_without_region == nil then nil else "assets/fdroid-screenshot-#{lang_without_region}.png" end
      default_path = "assets/fdroid-screenshot-en.png"

      if File::exists? "#{site_source}/#{preferred_path}"
        return preferred_path
      elsif acceptable_path != nil and File::exists? "#{site_source}/#{acceptable_path}"
        return acceptable_path
      else
        Jekyll::logger.warn "FDroid:", "Can't find localized screenshot for #{active_lang} at #{preferred_path} or #{acceptable_path}, falling back to #{default_path}"
        return default_path
      end
    end

    def just_lang(locale)
      regex = /(?<lang>[a-zA-Z]+)(?:_.*)?/
      result = locale.match(regex)
      if result == nil
        return nil
      else
        return result[:lang]
      end
    end
  end
end

Liquid::Template.register_tag('fdroid_screenshot', Jekyll::FDroidScreenshot)
