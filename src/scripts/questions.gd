extends Node


const QUESTIONS = {
	"Bus": [
	{
		"text": "Electric buses are known to reduce carbon emissions compared to diesel buses. Should France prioritize electric buses over upgrading diesel buses?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.8, "BusValue": -3 },
			"No": { "GDP": 5, "R&D": -0.5, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! Electric buses reduce emissions significantly and are a long-term sustainable solution.",
			"No": "Incorrect. Upgrading diesel buses may reduce emissions, but electric buses offer a greater benefit."
		}
	},
	{
		"text": "France has introduced subsidies to encourage public bus usage. Should these subsidies focus on rural areas to reduce car dependency?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.5, "BusValue": -2 },
			"No": { "GDP": 0, "R&D": -0.3, "BusValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. While important, focusing subsidies solely on rural areas might neglect urban congestion.",
			"No": "Correct! Distributing subsidies equally ensures both rural and urban areas benefit."
		}
	},
	{
		"text": "Charging infrastructure for electric buses is a barrier to adoption. Should France invest more in charging stations to support electrification?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.7, "BusValue": -3 },
			"No": { "GDP": 5, "R&D": -0.4, "BusValue": 2 }
		},
		"output": {
			"Yes": "Correct! Expanding charging infrastructure is crucial to scaling up electric bus fleets.",
			"No": "Incorrect. Lack of charging infrastructure could hinder the adoption of electric buses."
		}
	},
	{
		"text": "Hydrogen-powered buses emit only water vapor. Should France adopt hydrogen buses despite their high costs?",
		"effects": {
			"Yes": { "GDP": -18, "R&D": 1.0, "BusValue": -4 },
			"No": { "GDP": 5, "R&D": -0.6, "BusValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Hydrogen buses remain expensive and may not yet be practical for widespread adoption.",
			"No": "Correct! Waiting for cost reductions ensures more sustainable long-term investments."
		}
	},
	{
		"text": "Bus Rapid Transit (BRT) systems reduce urban congestion. Should French cities invest more in BRT instead of expanding metro lines?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.6, "BusValue": -3 },
			"No": { "GDP": 5, "R&D": -0.3, "BusValue": 2 }
		},
		"output": {
			"Yes": "Correct! BRT systems are cost-effective and reduce emissions by encouraging bus usage.",
			"No": "Incorrect. Expanding metro lines is costly and may take years to impact urban mobility."
		}
	}
],




"Car": [
	{
		"text": "France plans to ban internal combustion engine vehicles by 2035. Should this ban include hybrid vehicles?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.9, "CarValue": -3 },
			"No": { "GDP": 5, "R&D": -0.6, "CarValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Including hybrids could discourage innovation in transitional technologies.",
			"No": "Correct! Excluding hybrids allows a smoother transition to fully electric vehicles."
		}
	},
	{
		"text": "Producing EV batteries involves significant CO2 emissions. Should France invest in recycling batteries to reduce these emissions?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.8, "CarValue": -4 },
			"No": { "GDP": 0, "R&D": -0.5, "CarValue": 3 }
		},
		"output": {
			"Yes": "Correct! Recycling reduces environmental impacts and secures valuable materials.",
			"No": "Incorrect. Ignoring recycling would lead to more mining and greater emissions."
		}
	},
	{
		"text": "Diesel cars are more fuel-efficient than gasoline cars. Should France reduce taxes on diesel vehicles to support affordability?",
		"effects": {
			"Yes": { "GDP": 5, "R&D": -0.5, "CarValue": 4 },
			"No": { "GDP": -10, "R&D": 0.6, "CarValue": -3 }
		},
		"output": {
			"Yes": "Incorrect. Diesel taxes discourage high-emission vehicles and promote cleaner alternatives.",
			"No": "Correct! Maintaining higher taxes aligns with France's climate goals."
		}
	},
	{
		"text": "Hydrogen cars emit no greenhouse gases. Should France prioritize hydrogen vehicles over electric vehicles?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 1.0, "CarValue": -4 },
			"No": { "GDP": 5, "R&D": -0.4, "CarValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Hydrogen infrastructure is less developed than EV charging networks.",
			"No": "Correct! Prioritizing EVs ensures faster adoption and lower costs."
		}
	},
	{
		"text": "Car-sharing reduces private car usage. Should France provide incentives for car-sharing programs?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.6, "CarValue": -2 },
			"No": { "GDP": 5, "R&D": -0.3, "CarValue": 3 }
		},
		"output": {
			"Yes": "Correct! Car-sharing reduces congestion and emissions in urban areas.",
			"No": "Incorrect. Ignoring car-sharing programs would slow progress in reducing car dependency."
		}
	}
],


"Cement": [
	{
		"text": "Cement production emits large amounts of CO2. Should France invest in low-carbon cement technologies despite their higher costs?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.8, "CementValue": -3 },
			"No": { "GDP": 5, "R&D": -0.6, "CementValue": 4 }
		},
		"output": {
			"Yes": "Correct! Low-carbon cement is vital for reducing emissions in construction.",
			"No": "Incorrect. Delaying investment would hinder progress toward climate goals."
		}
	},
	{
		"text": "France has reduced its cement production quotas to lower emissions. Should this policy be reversed to support economic growth?",
		"effects": {
			"Yes": { "GDP": 10, "R&D": -0.3, "CementValue": 4 },
			"No": { "GDP": -12, "R&D": 0.7, "CementValue": -3 }
		},
		"output": {
			"Yes": "Incorrect. Reversing the quotas would increase emissions and contradict climate objectives.",
			"No": "Correct! Maintaining quotas ensures France meets its emissions reduction targets."
		}
	},
	{
		"text": "Recycled materials like fly ash reduce the need for traditional cement. Should France mandate the use of these materials in construction?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.6, "CementValue": -4 },
			"No": { "GDP": 5, "R&D": -0.4, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! Mandating recycled materials reduces emissions and promotes sustainability.",
			"No": "Incorrect. Ignoring recycled materials would lead to higher emissions."
		}
	},
	{
		"text": "Carbon taxes encourage cleaner production methods. Should France increase carbon taxes on the cement industry?",
		"effects": {
			"Yes": { "GDP": -18, "R&D": 0.9, "CementValue": -5 },
			"No": { "GDP": 5, "R&D": -0.5, "CementValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Increasing taxes too quickly could hurt economic competitiveness.",
			"No": "Correct! Gradual adjustments ensure compliance without overwhelming the industry."
		}
	},
	{
		"text": "France exports low-carbon cement technologies. Should it prioritize domestic adoption before exporting?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.7, "CementValue": -3 },
			"No": { "GDP": 5, "R&D": -0.4, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! Focusing on domestic adoption ensures France leads by example.",
			"No": "Incorrect. Prioritizing exports might undermine domestic sustainability goals."
		}
	}
],

"Metal": [
	{
		"text": "Recycled metals require less energy to produce. Should France increase incentives for using recycled metals?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.6, "MetalValue": -3 },
			"No": { "GDP": 5, "R&D": -0.3, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct! Recycling reduces emissions and supports the circular economy.",
			"No": "Incorrect. Ignoring incentives would slow the adoption of sustainable practices."
		}
	},
	{
		"text": "Green hydrogen is a cleaner alternative in steel production. Should France prioritize green hydrogen despite its high costs?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 1.0, "MetalValue": -4 },
			"No": { "GDP": 5, "R&D": -0.6, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Green hydrogen is still expensive and may not yet be viable at scale.",
			"No": "Correct! Waiting for cost reductions ensures more efficient adoption."
		}
	},
	{
		"text": "Aluminum is energy-intensive to produce. Should France focus on renewable energy for aluminum production?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.8, "MetalValue": -4 },
			"No": { "GDP": 5, "R&D": -0.4, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct! Renewable energy reduces the carbon footprint of aluminum production.",
			"No": "Incorrect. Ignoring renewable energy would increase emissions significantly."
		}
	},
	{
		"text": "France imposes carbon taxes on metal industries. Should these taxes be increased to further reduce emissions?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 0.9, "MetalValue": -5 },
			"No": { "GDP": 5, "R&D": -0.5, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Rapid tax increases could harm industrial competitiveness.",
			"No": "Correct! Gradual increases strike a balance between emissions reduction and economic stability."
		}
	},
	{
		"text": "France exports sustainable metal technologies. Should these exports be expanded to boost economic growth?",
		"effects": {
			"Yes": { "GDP": 15, "R&D": 0.4, "MetalValue": -2 },
			"No": { "GDP": -5, "R&D": -0.3, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct! Exporting these technologies strengthens the economy and promotes global sustainability.",
			"No": "Incorrect. Limiting exports might reduce France's influence in sustainable development."
		}
	}
],

"Nuclear": [
	{
		"text": "Nuclear energy provides over 70% of France's electricity. Should nuclear power remain a key part of France's low-carbon energy strategy?",
		"effects": {
			"Yes": { "GDP": 10, "R&D": 0.6, "NuclearValue": -3 },
			"No": { "GDP": -10, "R&D": -0.4, "NuclearValue": 4 }
		},
		"output": {
			"Yes": "Correct! Nuclear power is a reliable, low-carbon energy source that helps France meet its climate goals.",
			"No": "Incorrect. Reducing reliance on nuclear would increase dependence on fossil fuels, contradicting climate objectives."
		}
	},
	{
		"text": "France produces radioactive waste from its nuclear reactors. Should the country invest more in long-term waste storage solutions?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.8, "NuclearValue": -4 },
			"No": { "GDP": 5, "R&D": -0.5, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Focusing solely on long-term storage without exploring reprocessing limits sustainability.",
			"No": "Correct! Diversifying efforts between storage and reprocessing addresses waste management more holistically."
		}
	},
	{
		"text": "Small Modular Reactors (SMRs) are being developed for greater efficiency and safety. Should France prioritize research into SMRs?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 1.0, "NuclearValue": -3 },
			"No": { "GDP": 5, "R&D": -0.6, "NuclearValue": 4 }
		},
		"output": {
			"Yes": "Correct! SMRs promise enhanced safety and efficiency, aligning with France’s energy goals.",
			"No": "Incorrect. Overlooking SMR research could hinder France's innovation in clean energy solutions."
		}
	},
	{
		"text": "Nuclear plants require uranium imports, posing potential risks to energy security. Should France diversify its energy mix to reduce dependence on uranium?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.5, "NuclearValue": -3 },
			"No": { "GDP": 5, "R&D": -0.4, "NuclearValue": 2 }
		},
		"output": {
			"Yes": "Incorrect. Diversifying too quickly could strain resources and destabilize energy production.",
			"No": "Correct! Maintaining a nuclear base while gradually diversifying ensures energy stability."
		}
	},
	{
		"text": "France exports nuclear technology globally. Should the country expand its nuclear technology exports to support global energy needs?",
		"effects": {
			"Yes": { "GDP": 15, "R&D": 0.4, "NuclearValue": -2 },
			"No": { "GDP": -5, "R&D": -0.3, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Overexpansion could lead to resource constraints in domestic nuclear development.",
			"No": "Correct! Limiting exports ensures France retains its technological edge and meets internal demands first."
		}
	},
	{
		"text": "Nuclear safety is a priority for public trust. Should France invest more in safety measures to prevent nuclear accidents?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.7, "NuclearValue": -3 },
			"No": { "GDP": 5, "R&D": -0.4, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! Enhanced safety measures are crucial to maintaining trust and avoiding potential disasters.",
			"No": "Incorrect. Neglecting safety undermines public trust and increases the risk of catastrophic incidents."
		}
	},
	{
		"text": "Reprocessing spent nuclear fuel can reduce waste and reuse materials. Should France invest further in reprocessing technologies?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.8, "NuclearValue": -4 },
			"No": { "GDP": 5, "R&D": -0.5, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Incorrect. Reprocessing is costly and creates its own set of challenges, including secondary waste.",
			"No": "Correct! Prioritizing alternative waste reduction methods can offer more immediate benefits."
		}
	},
	{
		"text": "Nuclear fusion is considered the future of clean energy. Should France prioritize fusion research despite its high costs?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 1.2, "NuclearValue": -3 },
			"No": { "GDP": 5, "R&D": -0.6, "NuclearValue": 4 }
		},
		"output": {
			"Yes": "Incorrect. While promising, fusion research is still decades away from being viable on a large scale.",
			"No": "Correct! Balancing fusion research with more immediate energy needs ensures France’s energy stability."
		}
	},
	{
		"text": "Nuclear energy has a lower carbon footprint but high upfront costs. Should France continue building new reactors to meet energy demands?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.6, "NuclearValue": -3 },
			"No": { "GDP": 5, "R&D": -0.4, "NuclearValue": 4 }
		},
		"output": {
			"Yes": "Incorrect. Building new reactors may divert resources from modernizing existing plants.",
			"No": "Correct! Focused upgrades to current facilities offer better short-term returns on investment."
		}
	},
	{
		"text": "France is phasing out older nuclear reactors. Should these be replaced with advanced designs for better efficiency?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.7, "NuclearValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "NuclearValue": 4 }
		},
		"output": {
			"Yes": "Correct! Advanced reactor designs improve efficiency and safety, reducing waste and emissions.",
			"No": "Incorrect. Replacing outdated reactors with advanced designs ensures long-term sustainability."
		}
	}
]
}
