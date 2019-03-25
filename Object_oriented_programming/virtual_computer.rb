class Computer
    @@users = {}
      def initialize(username, password)
      @username = username
      @password = password
        @files = {}
      @@users[username] = password
    end
    
    def create(filename)
        time = Time.now
      @files[filename] = time
      puts "#{@username} added #{filename} at #{time}"
    end
    
  end