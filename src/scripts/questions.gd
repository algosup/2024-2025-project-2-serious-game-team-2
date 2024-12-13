extends Node


const QUESTIONS = {
	"Bus": [
	{
		"text": "In 2020, public transportation accounted for a significant share of urban mobility in France. Are buses considered one of the least carbon-intensive modes of public transport?",
		"effects": {
			"Yes": { "GDP": -5, "R&D": 0.5, "BusValue": -2 },
			"No": { "GDP": 0, "R&D": -0.3, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! Modern buses, especially electric and hybrid models, emit significantly less CO2 compared to private cars.",
			"No": "Incorrect. While traditional diesel buses contribute to emissions, modern buses are designed to be more eco-friendly."
		}
	},
	{
		"text": "France has been transitioning to electric buses as part of its climate action plan. By 2030, is France aiming for at least 50% of its bus fleet to be electric?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.7, "BusValue": -4 },
			"No": { "GDP": 0, "R&D": -0.4, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! The French government has set ambitious goals to electrify public transportation to reduce emissions.",
			"No": "Incorrect. France's climate action plan includes electrifying a significant portion of its bus fleet."
		}
	},
	{
		"text": "The European Union's Clean Vehicle Directive aims to promote sustainable public transport. Does this directive require a minimum percentage of low-emission buses in public contracts?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.6, "BusValue": -3 },
			"No": { "GDP": 0, "R&D": -0.2, "BusValue": 2 }
		},
		"output": {
			"Yes": "Correct! The directive ensures that public contracts prioritize low- and zero-emission vehicles, including buses.",
			"No": "Incorrect. The Clean Vehicle Directive mandates the inclusion of low-emission buses in public procurement."
		}
	},
	{
		"text": "Public transport is often subsidized to encourage usage and reduce emissions. In France, do subsidies cover a portion of operating costs for regional bus services?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.4, "BusValue": -2 },
			"No": { "GDP": 0, "R&D": -0.3, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! Subsidies help keep ticket prices affordable and promote bus usage over private cars.",
			"No": "Incorrect. Subsidies are essential for maintaining accessible and environmentally friendly public transport."
		}
	},
	{
		"text": "France has implemented Low Emission Zones (LEZs) in major cities. Are buses required to meet stricter emission standards in these zones?",
		"effects": {
			"Yes": { "GDP": -7, "R&D": 0.5, "BusValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "BusValue": 4 }
		},
		"output": {
			"Yes": "Correct! LEZs require public vehicles like buses to adhere to higher emission standards.",
			"No": "Incorrect. Buses must meet stricter emission standards to operate in Low Emission Zones."
		}
	},
	{
		"text": "In 2021, France adopted the Mobility Orientation Law to improve public transport infrastructure. Does this law prioritize rural connectivity through bus services?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.6, "BusValue": -4 },
			"No": { "GDP": 0, "R&D": -0.3, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! The Mobility Orientation Law emphasizes improving rural transport, including bus networks, to reduce car dependency.",
			"No": "Incorrect. The law focuses on enhancing public transport infrastructure, including rural bus services."
		}
	},
	{
		"text": "Electrification of bus fleets can be challenging due to infrastructure needs. Does charging infrastructure availability limit the adoption of electric buses in many French cities?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.8, "BusValue": -4 },
			"No": { "GDP": 0, "R&D": -0.5, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! Limited charging infrastructure is a significant barrier to scaling up electric bus fleets.",
			"No": "Incorrect. Charging infrastructure is a critical factor in the adoption of electric buses."
		}
	},
	{
		"text": "Bus Rapid Transit (BRT) systems are an efficient way to reduce urban congestion. Has France implemented BRT systems in any of its cities?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.6, "BusValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! Cities like Nantes and Lyon have implemented BRT systems to improve urban mobility.",
			"No": "Incorrect. Several French cities have adopted BRT systems to reduce congestion and emissions."
		}
	},
	{
		"text": "Hydrogen-powered buses are emerging as a clean alternative. Is France actively testing hydrogen buses as part of its sustainability initiatives?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 1.0, "BusValue": -5 },
			"No": { "GDP": 0, "R&D": -0.6, "BusValue": 4 }
		},
		"output": {
			"Yes": "Correct! France is testing hydrogen buses as a sustainable solution to further reduce emissions.",
			"No": "Incorrect. Hydrogen buses are part of France's sustainability initiatives to decarbonize public transport."
		}
	},
	{
		"text": "Modernizing bus fleets requires significant investment. Has the French government allocated specific funds for bus modernization under its recovery plan?",
		"effects": {
			"Yes": { "GDP": -18, "R&D": 0.7, "BusValue": -4 },
			"No": { "GDP": 0, "R&D": -0.5, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! Bus modernization is a key component of France's recovery and sustainability plans.",
			"No": "Incorrect. The government has allocated funds to modernize bus fleets as part of its recovery plan."
		}
	}
],




"Car": [
	{
		"text": "France plans to ban the sale of internal combustion engine vehicles by 2035. Is this policy aligned with the European Union's Green Deal?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.8, "CarValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "CarValue": 2 }
		},
		"output": {
			"Yes": "Correct! The EU's Green Deal promotes phasing out internal combustion engines to reduce emissions by 2050.",
			"No": "Incorrect. This policy is part of the EU's Green Deal for carbon neutrality by mid-century."
		}
	},
	{
		"text": "Electric vehicles (EVs) are less carbon-intensive than gasoline cars. Does producing EV batteries contribute significantly to CO2 emissions?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.6, "CarValue": -4 },
			"No": { "GDP": 0, "R&D": -0.4, "CarValue": 3 }
		},
		"output": {
			"Yes": "Correct! Battery production has a high carbon footprint, though EVs offset this through lower emissions over time.",
			"No": "Incorrect. EV battery production contributes significantly to CO2 emissions during manufacturing."
		}
	},
	{
		"text": "France provides subsidies to encourage the purchase of electric vehicles. Are these subsidies expected to decrease GDP in the short term?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.7, "CarValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "CarValue": 2 }
		},
		"output": {
			"Yes": "Correct! Subsidies require government spending, which can reduce GDP initially while promoting sustainability.",
			"No": "Incorrect. Subsidies often impact GDP in the short term due to financial allocations."
		}
	},
	{
		"text": "In urban areas, car-sharing programs have grown in popularity. Do these programs help reduce CO2 emissions by lowering private car usage?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.5, "CarValue": -2 },
			"No": { "GDP": 0, "R&D": -0.3, "CarValue": 3 }
		},
		"output": {
			"Yes": "Correct! Car-sharing programs reduce the need for private vehicles, lowering overall CO2 emissions.",
			"No": "Incorrect. Car-sharing programs effectively decrease CO2 emissions by reducing the number of cars on the road."
		}
	},
	{
		"text": "France recently increased taxes on diesel cars to discourage their use. Does this tax contribute to reducing air pollution?",
		"effects": {
			"Yes": { "GDP": -7, "R&D": 0.4, "CarValue": -3 },
			"No": { "GDP": 0, "R&D": -0.2, "CarValue": 4 }
		},
		"output": {
			"Yes": "Correct! Diesel taxes are part of efforts to reduce harmful emissions and promote cleaner alternatives.",
			"No": "Incorrect. Increasing diesel taxes helps reduce air pollution by discouraging their use."
		}
	},
	{
		"text": "Hydrogen fuel cell vehicles emit only water vapor. Is France actively investing in hydrogen infrastructure for cars?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 1.0, "CarValue": -4 },
			"No": { "GDP": 0, "R&D": -0.7, "CarValue": 3 }
		},
		"output": {
			"Yes": "Correct! Hydrogen is a major focus of France's clean energy transition for transportation.",
			"No": "Incorrect. France is actively developing hydrogen infrastructure to support fuel cell vehicles."
		}
	},
	{
		"text": "France offers tax credits for companies switching to electric fleets. Are these incentives designed to reduce corporate transportation emissions?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.7, "CarValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "CarValue": 2 }
		},
		"output": {
			"Yes": "Correct! Tax credits help businesses adopt cleaner fleets, reducing their transportation emissions.",
			"No": "Incorrect. These incentives are aimed at promoting electric vehicle adoption in corporate fleets."
		}
	},
	{
		"text": "Autonomous vehicles are expected to transform urban mobility. Is France investing in autonomous vehicle research to enhance traffic efficiency?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.9, "CarValue": -5 },
			"No": { "GDP": 0, "R&D": -0.4, "CarValue": 2 }
		},
		"output": {
			"Yes": "Correct! Autonomous vehicles are a key area of research to improve traffic and reduce emissions.",
			"No": "Incorrect. France is investing in autonomous vehicle research to address urban mobility challenges."
		}
	},
	{
		"text": "Electric vehicles rely on rare earth metals like lithium. Is recycling EV batteries critical for reducing environmental impacts?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.8, "CarValue": -4 },
			"No": { "GDP": 0, "R&D": -0.6, "CarValue": 3 }
		},
		"output": {
			"Yes": "Correct! Recycling EV batteries is essential to mitigate the environmental impact of rare earth mining.",
			"No": "Incorrect. Battery recycling plays a crucial role in reducing the environmental footprint of EVs."
		}
	},
	{
		"text": "France has invested heavily in public charging stations for electric cars. Does this investment aim to make EVs more accessible for consumers?",
		"effects": {
			"Yes": { "GDP": -18, "R&D": 0.6, "CarValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "CarValue": 4 }
		},
		"output": {
			"Yes": "Correct! Expanding charging infrastructure is key to increasing EV adoption across France.",
			"No": "Incorrect. Public charging stations are critical for making EVs accessible to a wider audience."
		}
	}
],


"Cement": [
	{
		"text": "Cement production accounts for around 8% of global CO2 emissions. Has France implemented policies to reduce emissions in this industry?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.8, "CementValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! France has introduced measures such as carbon taxes and low-carbon cement alternatives to address emissions.",
			"No": "Incorrect. France has actively implemented policies to reduce emissions in the cement industry."
		}
	},
	{
		"text": "Low-carbon cement technologies are gaining attention. Are these alternatives more expensive to produce than traditional cement?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.6, "CementValue": -4 },
			"No": { "GDP": 0, "R&D": -0.4, "CementValue": 2 }
		},
		"output": {
			"Yes": "Correct! Low-carbon cement requires additional processing and new materials, increasing production costs.",
			"No": "Incorrect. Low-carbon cement is indeed more expensive to produce than traditional cement."
		}
	},
	{
		"text": "France has introduced carbon taxes targeting heavy industries like cement. Do these taxes encourage companies to adopt cleaner technologies?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.7, "CementValue": -3 },
			"No": { "GDP": 0, "R&D": -0.3, "CementValue": 4 }
		},
		"output": {
			"Yes": "Correct! Carbon taxes incentivize companies to invest in cleaner and more sustainable technologies.",
			"No": "Incorrect. Carbon taxes are designed to push industries toward adopting cleaner practices."
		}
	},
	{
		"text": "Cement manufacturing involves a process called 'calcination,' which releases significant CO2 emissions. Is France investing in technologies to reduce these emissions?",
		"effects": {
			"Yes": { "GDP": -14, "R&D": 0.8, "CementValue": -4 },
			"No": { "GDP": 0, "R&D": -0.5, "CementValue": 2 }
		},
		"output": {
			"Yes": "Correct! France is investing in carbon capture and storage technologies to reduce emissions from calcination.",
			"No": "Incorrect. France is actively working to reduce emissions from calcination through advanced technologies."
		}
	},
	{
		"text": "Recycled materials like fly ash and slag can replace traditional cement ingredients. Has France promoted the use of these materials in construction?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.5, "CementValue": -3 },
			"No": { "GDP": 0, "R&D": -0.3, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! Using recycled materials helps lower emissions and reduces reliance on traditional cement.",
			"No": "Incorrect. France encourages the use of recycled materials to promote sustainability in construction."
		}
	},
	{
		"text": "France has funded research into alternative binders for cement, such as geopolymers. Do these alternatives have a lower carbon footprint than traditional cement?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.9, "CementValue": -4 },
			"No": { "GDP": 0, "R&D": -0.4, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! Geopolymers and other alternatives produce fewer emissions compared to traditional cement.",
			"No": "Incorrect. Alternative binders like geopolymers significantly reduce the carbon footprint of cement production."
		}
	},
	{
		"text": "France has reduced its cement production quotas to meet climate goals. Is this reduction expected to decrease GDP?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 0.4, "CementValue": -2 },
			"No": { "GDP": 0, "R&D": -0.5, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! Lower production quotas can impact GDP but help reduce emissions significantly.",
			"No": "Incorrect. Reducing production quotas often leads to a decrease in GDP due to lower industrial activity."
		}
	},
	{
		"text": "Concrete is one of the most used materials in construction. Does using high-performance concrete reduce overall cement consumption?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.6, "CementValue": -3 },
			"No": { "GDP": 0, "R&D": -0.3, "CementValue": 2 }
		},
		"output": {
			"Yes": "Correct! High-performance concrete requires less cement while offering better strength and durability.",
			"No": "Incorrect. High-performance concrete helps reduce cement consumption in construction projects."
		}
	},
	{
		"text": "France has started exporting low-carbon cement technologies to other countries. Is this export likely to contribute positively to France's economy?",
		"effects": {
			"Yes": { "GDP": 10, "R&D": 0.3, "CementValue": -2 },
			"No": { "GDP": 0, "R&D": -0.4, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! Exporting low-carbon technologies enhances economic growth while promoting sustainability globally.",
			"No": "Incorrect. Exporting these technologies positively impacts the economy and supports global sustainability."
		}
	},
	{
		"text": "France has introduced a nationwide policy requiring cement factories to report their annual CO2 emissions. Is this policy expected to reduce emissions in the cement industry?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.5, "CementValue": -3 },
			"No": { "GDP": 0, "R&D": -0.2, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! Transparency in emissions reporting encourages factories to adopt cleaner technologies.",
			"No": "Incorrect. Emissions reporting policies are designed to incentivize emission reductions through transparency."
		}
	}
],

"Metal": [
	{
		"text": "Metals like aluminum and steel are essential for modern infrastructure but are energy-intensive to produce. Is France investing in low-emission technologies for metal production?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.7, "MetalValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct! France is promoting energy-efficient technologies and renewable energy use in metal production.",
			"No": "Incorrect. France has been investing in low-emission technologies to reduce the carbon footprint of metal production."
		}
	},
	{
		"text": "Steel production generates large amounts of CO2. Is France adopting green hydrogen as a cleaner alternative in steelmaking?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.9, "MetalValue": -4 },
			"No": { "GDP": 0, "R&D": -0.6, "MetalValue": 2 }
		},
		"output": {
			"Yes": "Correct! Green hydrogen is being used to replace fossil fuels, significantly reducing emissions.",
			"No": "Incorrect. France is actively using green hydrogen in steel production to lower emissions."
		}
	},
	{
		"text": "Recycled metals are key to a circular economy. Is France encouraging industries to use more recycled materials in production?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.5, "MetalValue": -3 },
			"No": { "GDP": 0, "R&D": -0.3, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct! Recycled metals require less energy to produce, reducing emissions and waste.",
			"No": "Incorrect. France has policies encouraging the use of recycled metals to support sustainability."
		}
	},
	{
		"text": "Aluminum is one of the most energy-intensive metals to produce. Is France investing in renewable energy sources for aluminum smelting?",
		"effects": {
			"Yes": { "GDP": -14, "R&D": 0.7, "MetalValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "MetalValue": 2 }
		},
		"output": {
			"Yes": "Correct! Renewable energy in aluminum production helps reduce emissions significantly.",
			"No": "Incorrect. France is integrating renewable energy into aluminum smelting to lower its environmental impact."
		}
	},
	{
		"text": "Rare earth metals are crucial for renewable technologies. Is France focusing on recycling rare earth elements to reduce dependence on mining?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.6, "MetalValue": -4 },
			"No": { "GDP": 0, "R&D": -0.3, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct! Recycling rare earth metals reduces environmental damage and reliance on mining.",
			"No": "Incorrect. France is prioritizing recycling to ensure a sustainable supply of rare earth elements."
		}
	},
	{
		"text": "France has introduced a carbon tax for metal industries. Does this tax aim to encourage cleaner production methods?",
		"effects": {
			"Yes": { "GDP": -18, "R&D": 0.4, "MetalValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "MetalValue": 4 }
		},
		"output": {
			"Yes": "Correct! Carbon taxes incentivize companies to adopt more sustainable and energy-efficient practices.",
			"No": "Incorrect. France’s carbon tax is designed to encourage cleaner production methods in the metal industry."
		}
	},
	{
		"text": "France is developing lightweight metal alloys for electric vehicles. Do these alloys contribute to reduced emissions in transportation?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.6, "MetalValue": -3 },
			"No": { "GDP": 0, "R&D": -0.3, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct! Lightweight alloys improve vehicle efficiency, reducing emissions during operation.",
			"No": "Incorrect. France is focusing on lightweight alloys to support greener transportation solutions."
		}
	},
	{
		"text": "France has introduced stricter regulations on mining waste management. Are these regulations expected to increase research in waste reduction technologies?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.9, "MetalValue": -4 },
			"No": { "GDP": 0, "R&D": -0.4, "MetalValue": 2 }
		},
		"output": {
			"Yes": "Correct! Stricter waste management rules drive innovation in reducing mining byproducts.",
			"No": "Incorrect. New regulations are leading to increased research in sustainable mining practices."
		}
	},
	{
		"text": "France has recently expanded its export of sustainable metal technologies. Does this contribute positively to the country's economy?",
		"effects": {
			"Yes": { "GDP": 10, "R&D": 0.3, "MetalValue": -2 },
			"No": { "GDP": 0, "R&D": -0.5, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct! Exporting sustainable technologies boosts France’s economy while promoting global sustainability.",
			"No": "Incorrect. The export of sustainable metal technologies positively impacts the French economy."
		}
	},
	{
		"text": "France has partnered with international organizations to improve the traceability of metals. Does this initiative help reduce illegal mining and its environmental impact?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.7, "MetalValue": -3 },
			"No": { "GDP": 0, "R&D": -0.3, "MetalValue": 4 }
		},
		"output": {
			"Yes": "Correct! Traceability measures help combat illegal mining and its associated environmental damage.",
			"No": "Incorrect. Improving metal traceability is key to reducing illegal mining and its impact on ecosystems."
		}
	}
],

"Nuclear": [
	{
		"text": "Nuclear energy accounts for over 70% of France's electricity. Is nuclear energy considered a low-carbon energy source?",
		"effects": {
			"Yes": { "GDP": 5, "R&D": 0.7, "NuclearValue": -2 },
			"No": { "GDP": 0, "R&D": -0.5, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! Nuclear power emits very low levels of CO2 compared to fossil fuels, making it a key low-carbon energy source.",
			"No": "Incorrect. Nuclear energy is considered a low-carbon energy source due to its minimal CO2 emissions."
		}
	},
	{
		"text": "France is a leader in nuclear energy production. Is it true that nuclear energy generates radioactive waste that must be safely stored for thousands of years?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.5, "NuclearValue": -3 },
			"No": { "GDP": 0, "R&D": -0.6, "NuclearValue": 4 }
		},
		"output": {
			"Yes": "Correct! Radioactive waste is a challenge of nuclear energy, requiring careful long-term storage solutions.",
			"No": "Incorrect. Nuclear energy produces radioactive waste that requires safe and secure storage for thousands of years."
		}
	},
	{
		"text": "France is currently researching advanced nuclear reactors, such as Small Modular Reactors (SMRs). Do these reactors promise lower costs and increased safety?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.8, "NuclearValue": -4 },
			"No": { "GDP": 0, "R&D": -0.3, "NuclearValue": 2 }
		},
		"output": {
			"Yes": "Correct! SMRs are being developed for their potential to reduce costs and enhance safety in nuclear energy.",
			"No": "Incorrect. Advanced reactors like SMRs aim to lower costs and improve safety features."
		}
	},
	{
		"text": "In recent years, France has exported nuclear technology to other countries. Does this contribute to global energy security?",
		"effects": {
			"Yes": { "GDP": 10, "R&D": 0.4, "NuclearValue": -2 },
			"No": { "GDP": 0, "R&D": -0.5, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! Exporting nuclear technology helps enhance energy security and reduce global reliance on fossil fuels.",
			"No": "Incorrect. Nuclear technology exports contribute to global energy security by providing stable and reliable energy solutions."
		}
	},
	{
		"text": "France has implemented strict safety regulations for its nuclear power plants. Do these regulations aim to prevent accidents like the Fukushima disaster?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.6, "NuclearValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! France's safety regulations are designed to prevent nuclear accidents and protect public health.",
			"No": "Incorrect. Safety regulations aim to prevent disasters like Fukushima and maintain public trust in nuclear energy."
		}
	},
	{
		"text": "France has invested in reprocessing spent nuclear fuel. Does this process help reduce the volume of high-level radioactive waste?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.7, "NuclearValue": -4 },
			"No": { "GDP": 0, "R&D": -0.6, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! Reprocessing spent nuclear fuel reduces waste volume and allows some materials to be reused.",
			"No": "Incorrect. Reprocessing spent fuel is a key method for minimizing high-level radioactive waste."
		}
	},
	{
		"text": "Nuclear energy is a reliable power source, but its construction requires significant upfront investment. Does this investment contribute to GDP growth in the long term?",
		"effects": {
			"Yes": { "GDP": 20, "R&D": 0.3, "NuclearValue": -2 },
			"No": { "GDP": -5, "R&D": -0.2, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! Nuclear energy projects stimulate economic growth through job creation and technological advancements.",
			"No": "Incorrect. Investments in nuclear energy contribute to long-term GDP growth and energy stability."
		}
	},
	{
		"text": "France's nuclear plants rely on uranium imports. Are these imports a potential risk to energy security?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.2, "NuclearValue": -2 },
			"No": { "GDP": 0, "R&D": -0.4, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! Dependence on imported uranium can pose risks to energy security during global supply disruptions.",
			"No": "Incorrect. Reliance on uranium imports is a recognized risk for energy security in nuclear-reliant countries."
		}
	},
	{
		"text": "France is phasing out older reactors and replacing them with newer designs. Do these upgrades aim to improve efficiency and reduce environmental impact?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.8, "NuclearValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "NuclearValue": 4 }
		},
		"output": {
			"Yes": "Correct! Upgrading reactors improves energy efficiency and reduces waste and emissions.",
			"No": "Incorrect. Replacing older reactors with newer designs enhances efficiency and lowers environmental impact."
		}
	},
	{
		"text": "France is exploring nuclear fusion as a potential future energy source. Is fusion expected to produce less radioactive waste than current nuclear fission reactors?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 1.0, "NuclearValue": -3 },
			"No": { "GDP": 0, "R&D": -0.7, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! Nuclear fusion produces significantly less waste and has the potential to provide virtually limitless energy.",
			"No": "Incorrect. Fusion is expected to produce less radioactive waste compared to traditional fission reactors."
		}
	}
]


}
