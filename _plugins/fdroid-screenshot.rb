#
# Helper tag to find the correct screenshot based on the sites language.  Will
# attempt to match just the language code (without region) if the more specific
# locale can't be found.  If no matching screenshot if found, a warning message
# is logged and it falls back to "en".
#
module Jekyll
  class FDroidScreenshot < Liquid::Tag
    def render(context)
      site = context.registers[:site]
      site_source = site.config['source']
      active_lang = site.active_lang
      lang_without_region = just_lang(active_lang)

      preferred_path = "assets/fdroid-screenshot-#{active_lang}.png"
      acceptable_path = lang_without_region &&
        "assets/fdroid-screenshot-#{lang_without_region}.png"
      default_path = "assets/fdroid-screenshot-en.png"

      if File::exist?("#{site_source}/#{preferred_path}")
        preferred_path
      elsif acceptable_path && File::exist?("#{site_source}/#{acceptable_path}")
        acceptable_path
      else
        Jekyll::logger.warn "FDroid:", "Can't find localized screenshot for #{active_lang} at #{preferred_path} or #{acceptable_path}, falling back to #{default_path}"
        default_path
      end
    end

    def just_lang(locale)
      locale.match(/(?<lang>[a-zA-Z]+)(?:_.*)?/)&.named_captures&.fetch('lang')
    end
  end
end

Liquid::Template.register_tag 'fdroid_screenshot', Jekyll::FDroidScreenshot
