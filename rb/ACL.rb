require 'cinch'
require 'rethinkdb'
module ZPlugins
    class ACL
      include RetjomlDB::Shortcuts
      include Cinch::Plugin
      match "acl", method: :ohey
      def initialize
        r.connect(:host=>"localhost", :port=>28015).run
        puts r.table('users').insert([
          {"name"=>"zackp30", "pass"=>"test", "rank"=>"1"}
        ]).run
      end
      def can
        
      end
      def ohey(m)
        m.reply r.table('users').run
      end
    end
end
