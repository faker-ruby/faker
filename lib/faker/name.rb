module Faker
  class Name < Base
    class << self
      
      def name
        fetch('name.formats').collect {|meth| self.send(meth) }.join(' ')
      end
      
      def first_name; fetch('name.first_name'); end
      def last_name;  fetch('name.last_name'); end
      def prefix;     fetch('name.prefix'); end
      def suffix;     fetch('name.suffix'); end
      
      # Generate a buzzword-laden job title
      # Wordlist from http://www.bullshitjob.com/title/
      def title
        [
          ["Lead", "Senior", "Direct", "Corporate", "Dynamic", "Future", "Product", "National", "Regional", "District", "Central", "Global", "Customer", "Investor", "Dynamic", "International", "Legacy", "Forward", "Internal", "Human", "Chief", "Principal"].rand, 
          ["Solutions", "Program", "Brand", "Security", "Research", "Marketing", "Directives", "Implementation", "Integration", "Functionality", "Response", "Paradigm", "Tactics", "Identity", "Markets", "Group", "Division", "Applications", "Optimization", "Operations", "Infrastructure", "Intranet", "Communications", "Web", "Branding", "Quality", "Assurance", "Mobility", "Accounts", "Data", "Creative", "Configuration", "Accountability", "Interactions", "Factors", "Usability", "Metrics"].rand,
          ["Supervisor", "Associate", "Executive", "Liason", "Officer", "Manager", "Engineer", "Specialist", "Director", "Coordinator", "Administrator", "Architect", "Analyst", "Designer", "Planner", "Orchestrator", "Technician", "Developer", "Producer", "Consultant", "Assistant", "Facilitator", "Agent", "Representative", "Strategist"].rand
        ].join(' ')
      end
      
    end
  end
end
