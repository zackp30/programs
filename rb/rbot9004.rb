require 'cinch'
Dir.glob('plugins/*.rb').each { |f| require "#{Dir.getwd}/#{f}" }
class PluginManager
  include Cinch::Plugin
  def initialize(*args)
    super
    @plugdir = Dir.pwd + '/plugins'
    Dir.glob('plugins/*.rb').each { |f| bot.plugins.register_plugin Kernel.const_get "ZPlugins::#{f.split('plugins/')[1].split('.rb')[0]}"}
  end
  hook :pre, method: :update_plugin_list
  def update_plugin_list(m)
    @plugins = bot.plugins
  end
  match /loadplug (.+)/, method: :loadplug
  match /unloadplug (.+)/, method: :unload
  match /reloadplug (.+)/, method: :reload
  def loadplug(m, plugin)
    require "#{@plugdir}/#{plugin}"
    r = Kernel.const_get "ZPlugins::#{plugin}"
    @plugins.register_plugin r
    m.reply 'Plugin loaded.'
  end
  def unload(m, plugin)
    klass = Kernel.const_get "ZPlugins::#{plugin}"
    i = bot.plugins.find_index { |x| x.class == klass }
    bot.plugins.unregister_plugin(bot.plugins[i])
    m.reply 'Plugin unloaded.'
  end
  def reload(m, plugin)
    unload m, plugin
    loadplug m, plugin
  end
  def load_all_plugins
  end
end


bot = Cinch::Bot.new do
  configure do |c|
    c.plugins.plugins = []
    c.plugins.plugins += [PluginManager]
    c.server = 'charybdis.ilbelkyr.de'
    c.port = 194
    c.password = 'python349'
    c.channels = ['#services']
    c.nick = 'DahServ'
  end
end
bot.start
