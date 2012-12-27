require "active_record/connection_adapters/mysql_adapter"
require "activerecord-import/adapters/mysql_adapter"

class ActiveRecord::ConnectionAdapters::MysqlAdapter
  include ActiveRecord::Import::MysqlAdapter
  include ActiveRecord::Import::OnDuplicateKeyUpdateSupport

  #return true if the statement is a duplicate key record error
  def duplicate_key_update_error?(exception)# :nodoc:
    exception.is_a?(ActiveRecord::JDBCError) && exception.to_s.include?('Duplicate entry')
  end
end