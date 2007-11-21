module Faker
  class Address
    class << self
      def zip_code
        Faker.numerify(['#####', '#####-####'].at_rand)
      end
      
      def us_state
        ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'].at_rand
      end
      
      def us_state_abbr
        %w(AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY AE AA AP).at_rand
      end
      
      def street_suffix
        %w(Alley Avenue Branch Bridge Brook Brooks Burg Burgs Bypass Camp Canyon Cape Causeway Center Centers Circle Circles Cliff Cliffs Club Common Corner Corners Course Court Courts Cove Coves Creek Crescent Crest Crossing Crossroad Curve Dale Dam Divide Drive Drive Drives Estate Estates Expressway Extension Extensions Fall Falls Ferry Field Fields Flat Flats Ford Fords Forest Forge Forges Fork Forks Fort Freeway Garden Gardens Gateway Glen Glens Green Greens Grove Groves Harbor Harbors Haven Heights Highway Hill Hills Hollow Inlet Inlet Island Island Islands Islands Isle Isle Junction Junctions Key Keys Knoll Knolls Lake Lakes Land Landing Lane Light Lights Loaf Lock Locks Locks Lodge Lodge Loop Mall Manor Manors Meadow Meadows Mews Mill Mills Mission Mission Motorway Mount Mountain Mountain Mountains Mountains Neck Orchard Oval Overpass Park Parks Parkway Parkways Pass Passage Path Pike Pine Pines Place Plain Plains Plains Plaza Plaza Point Points Port Port Ports Ports Prairie Prairie Radial Ramp Ranch Rapid Rapids Rest Ridge Ridges River Road Road Roads Roads Route Row Rue Run Shoal Shoals Shore Shores Skyway Spring Springs Springs Spur Spurs Square Square Squares Squares Station Station Stravenue Stravenue Stream Stream Street Street Streets Summit Summit Terrace Throughway Trace Track Trafficway Trail Trail Tunnel Tunnel Turnpike Turnpike Underpass Union Unions Valley Valleys Via Viaduct View Views Village Village  Villages Ville Vista Vista Walk Walks Wall Way Ways Well Wells).at_rand
      end
    
      def street_name
        [ 
          Proc.new { [Name.last_name, street_suffix].join(' ') },
          Proc.new { [Name.first_name, street_suffix].join(' ') }      
        ].at_rand.call
      end
      
      def street_address
        Faker.numerify([
          Proc.new { '##### %s' % street_name },
          Proc.new { '##### %s' % street_name },
          Proc.new { '##### %s' % street_name },
          Proc.new { '##### %s' % street_name },
          Proc.new { '##### %s Apt. ###' % street_name },
          Proc.new { '##### %s Suite ###' % street_name }
        ].at_rand.call)
      end
      
    end
  end
end