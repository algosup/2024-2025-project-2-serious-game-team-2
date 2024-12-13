extends Node


const QUESTIONS = {
	"Bus": [
	{
		"text": "In the past week, the French government has launched a subsidy program to support the adoption of electric buses across the country. Has this initiative led to a decrease in GDP but also significantly reduced CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 0.6, "BusValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "BusValue": 4 }
		},
		"output": {
			"Yes": "Correct! The subsidy program has required substantial investment, slightly impacting GDP, while effectively lowering CO2 emissions from the bus fleet.",
			"No": "Incorrect. The initiative has indeed had a negative impact on GDP due to the costs involved, but it has successfully reduced CO2 emissions from buses."
		}
	},
	{
		"text": "Two days ago, reports emerged that France is considering the removal of all subsidies for traditional diesel buses. Is this removal expected to increase GDP and lead to higher CO2 emissions?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": -0.5, "BusValue": 5 },
			"No": { "GDP": 0, "R&D": 0.3, "BusValue": -2 }
		},
		"output": {
			"Yes": "Incorrect. Removing subsidies is likely to negatively impact GDP due to potential losses in the bus industry and could lead to higher CO2 emissions.",
			"No": "Correct! The removal of subsidies is expected to strain the bus industry, potentially increasing CO2 emissions while having no direct effect on GDP."
		}
	},
	{
		"text": "Last month, France implemented stricter emissions standards for all new buses entering the market. Has this policy resulted in a decrease in GDP but also a reduction in CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.9, "BusValue": -4 },
			"No": { "GDP": 0, "R&D": -0.2, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! Stricter emissions standards have required significant investment, slightly impacting GDP, while effectively reducing CO2 emissions from buses.",
			"No": "Incorrect. The new standards have indeed led to a decrease in GDP due to increased costs, but they have successfully reduced CO2 emissions."
		}
	},
	{
		"text": "Yesterday, France announced a plan to expand its bus network by 20% over the next year. Is this expansion expected to decrease GDP and lower CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -18, "R&D": 0.4, "BusValue": -5 },
			"No": { "GDP": 0, "R&D": -0.7, "BusValue": 2 }
		},
		"output": {
			"Yes": "Correct! Expanding the bus network requires significant investment, which can negatively impact GDP, but it also contributes to lower CO2 emissions by enhancing public transport usage.",
			"No": "Incorrect. The expansion is likely to decrease GDP due to the costs involved, while it effectively lowers CO2 emissions."
		}
	},
	{
		"text": "A few days ago, France decided to phase out old diesel buses in favor of hybrid models. Has this decision led to a reduction in GDP but also decreased CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -22, "R&D": 0.7, "BusValue": -3 },
			"No": { "GDP": 0, "R&D": -0.6, "BusValue": 4 }
		},
		"output": {
			"Yes": "Correct! Phasing out old diesel buses requires substantial investment, impacting GDP, while hybrid models contribute to lower CO2 emissions.",
			"No": "Incorrect. The decision has resulted in decreased GDP due to the costs of transitioning, but it has successfully reduced CO2 emissions."
		}
	},
	{
		"text": "Earlier this month, France proposed increasing the number of diesel buses to improve public transport coverage. Is this increase expected to boost GDP and reduce CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": -0.5, "BusValue": 5 },
			"No": { "GDP": 0, "R&D": 0.8, "BusValue": -3 }
		},
		"output": {
			"Yes": "Incorrect. Increasing diesel buses might not boost GDP due to higher operational costs and could lead to increased CO2 emissions.",
			"No": "Correct! The increase in diesel buses does not positively impact GDP and actually leads to higher CO2 emissions."
		}
	},
	{
		"text": "Recently, France has allocated funds to research alternative fuels for buses. Does this allocation lead to a decrease in GDP but also lower CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.5, "BusValue": -2 },
			"No": { "GDP": 0, "R&D": -0.3, "BusValue": 3 }
		},
		"output": {
			"Yes": "Correct! Investing in alternative fuels requires financial resources, slightly impacting GDP, while contributing to reduced CO2 emissions.",
			"No": "Incorrect. The allocation has a negative effect on GDP due to the investment costs, but it effectively lowers CO2 emissions."
		}
	},
	{
		"text": "Last week, France decided to maintain the current fleet of diesel buses without any upgrades. Is this maintenance expected to have no impact on GDP and lead to a decrease in CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": -0.4, "BusValue": 4 },
			"No": { "GDP": 0, "R&D": 0.6, "BusValue": -3 }
		},
		"output": {
			"Yes": "Incorrect. Maintaining the current fleet without upgrades does not reduce CO2 emissions and can negatively impact GDP due to inefficiencies.",
			"No": "Correct! Keeping the existing diesel buses without upgrades fails to decrease CO2 emissions and has no positive effect on GDP."
		}
	},
	{
		"text": "A few weeks ago, France initiated a program to integrate renewable energy sources into bus operations. Has this integration resulted in a decrease in GDP but also lowered CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -14, "R&D": 0.9, "BusValue": -4 },
			"No": { "GDP": 0, "R&D": -0.2, "BusValue": 2 }
		},
		"output": {
			"Yes": "Correct! Integrating renewable energy requires investment, slightly impacting GDP, while significantly reducing CO2 emissions from buses.",
			"No": "Incorrect. The integration has led to a decrease in GDP due to the costs involved, but it has successfully lowered CO2 emissions."
		}
	},
	{
		"text": "Recently, France opted to discontinue the use of hybrid buses in favor of traditional diesel models. Is this discontinuation expected to decrease GDP and reduce CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": -0.7, "BusValue": 5 },
			"No": { "GDP": 0, "R&D": 0.4, "BusValue": -2 }
		},
		"output": {
			"Yes": "Incorrect. Discontinuing hybrid buses is likely to harm GDP due to reduced innovation and will increase CO2 emissions.",
			"No": "Correct! The move away from hybrid buses does not decrease GDP and actually leads to higher CO2 emissions."
		}
	},
	{
		"text": "Two weeks ago, France announced a partnership with tech companies to develop smart bus systems. Has this partnership led to a decrease in GDP but also lowered CO2 emissions from buses?",
		"effects": {
			"Yes": { "GDP": -17, "R&D": 0.7, "BusValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "BusValue": 4 }
		},
		"output": {
			"Yes": "Correct! Collaborating with tech companies involves investment, slightly impacting GDP, while smart systems contribute to reduced CO2 emissions.",
			"No": "Incorrect. The partnership has resulted in a decrease in GDP due to the investments made, but it has effectively lowered CO2 emissions."
		}
	}
],




"Car" : [
	{
	  "text": "Last month, France announced a significant subsidy for electric vehicle (EV) production to combat climate change. Does this initiative lead to a reduction in GDP?",
	  "effects": {
		"Yes": { "GDP": -15, "R&D": 0.8, "CarValue": -4 },
		"No": { "GDP": 0, "R&D": -0.7, "CarValue": 3 }
	  },
	  "output": {
		"Yes": "Correct! The subsidy is expected to reduce GDP by 15 units due to increased production costs.",
		"No": "Incorrect. The subsidy will actually lead to a decrease in GDP."
	  }
	},
	{
	  "text": "Recently, France has banned the sale of all gasoline cars by 2035. Is this policy ineffective in reducing CO2 emissions?",
	  "effects": {
		"Yes": { "GDP": -20, "R&D": -0.5, "CarValue": 4 },
		"No": { "GDP": 0, "R&D": 0.6, "CarValue": -3 }
	  },
	  "output": {
		"Yes": "Incorrect. Banning gasoline cars is effective in reducing CO2 emissions.",
		"No": "Correct! The policy effectively reduces CO2 emissions by promoting cleaner vehicles."
	  }
	},
	{
	  "text": "In the past week, France has increased taxes on diesel vehicles to lower air pollution. Does this tax increase lead to higher CO2 emissions?",
	  "effects": {
		"Yes": { "GDP": -7, "R&D": -0.3, "CarValue": 2 },
		"No": { "GDP": 0, "R&D": 0.4, "CarValue": -2 }
	  },
	  "output": {
		"Yes": "Incorrect. Increasing taxes on diesel vehicles actually lowers CO2 emissions.",
		"No": "Correct! The tax increase helps reduce CO2 emissions by discouraging diesel use."
	  }
	},
	{
	  "text": "Two days ago, France launched a campaign encouraging the use of hybrid cars to reduce environmental impact. Will this campaign have no effect on GDP?",
	  "effects": {
		"Yes": { "GDP": 0, "R&D": 0.5, "CarValue": -3 },
		"No": { "GDP": -10, "R&D": -0.6, "CarValue": 4 }
	  },
	  "output": {
		"Yes": "Incorrect. The campaign is expected to reduce GDP due to increased production costs.",
		"No": "Correct! The campaign will have an impact on GDP by lowering it."
	  }
	},
	{
	  "text": "Recently, France has invested heavily in autonomous vehicle technology to improve transportation efficiency. Does this investment lead to a decrease in CO2 emissions?",
	  "effects": {
		"Yes": { "GDP": -12, "R&D": 0.9, "CarValue": -5 },
		"No": { "GDP": 0, "R&D": -0.4, "CarValue": 2 }
	  },
	  "output": {
		"Yes": "Correct! Investment in autonomous vehicles is expected to significantly reduce CO2 emissions.",
		"No": "Incorrect. The investment will actually decrease CO2 emissions."
	  }
	},
	{
	  "text": "A week ago, France decided to remove all incentives for electric cars to stabilize the economy. Is this decision beneficial for reducing CO2 emissions?",
	  "effects": {
		"Yes": { "GDP": -8, "R&D": -0.2, "CarValue": 3 },
		"No": { "GDP": 0, "R&D": 0.7, "CarValue": -4 }
	  },
	  "output": {
		"Yes": "Incorrect. Removing incentives for electric cars is not beneficial for reducing CO2 emissions.",
		"No": "Correct! The decision helps in reducing CO2 emissions by discouraging fossil fuel use."
	  }
	},
	{
	  "text": "Recently, France has introduced stricter emission standards for all new cars. Does this change result in increased research and development (R&D) in the automotive sector?",
	  "effects": {
		"Yes": { "GDP": -5, "R&D": 0.3, "CarValue": -2 },
		"No": { "GDP": 0, "R&D": -0.8, "CarValue": 5 }
	  },
	  "output": {
		"Yes": "Correct! Stricter emission standards encourage more investment in R&D.",
		"No": "Incorrect. The change actually leads to increased R&D in the automotive sector."
	  }
	},
	{
	  "text": "Last week, France decided to subsidize the production of diesel cars to support the automotive industry. Is this subsidy effective in lowering CO2 emissions?",
	  "effects": {
		"Yes": { "GDP": -18, "R&D": -0.6, "CarValue": 5 },
		"No": { "GDP": 0, "R&D": 0.2, "CarValue": -3 }
	  },
	  "output": {
		"Yes": "Incorrect. Subsidizing diesel cars actually increases CO2 emissions.",
		"No": "Correct! The subsidy is not effective in lowering CO2 emissions."
	  }
	},
	{
	  "text": "Two days ago, France launched a rebate program for consumers purchasing electric vehicles. Does this program have no impact on the country's GDP?",
	  "effects": {
		"Yes": { "GDP": 0, "R&D": 0.4, "CarValue": -3 },
		"No": { "GDP": -9, "R&D": -0.5, "CarValue": 4 }
	  },
	  "output": {
		"Yes": "Incorrect. The rebate program is expected to reduce GDP due to increased subsidies.",
		"No": "Correct! The program impacts GDP by decreasing it."
	  }
	},
	{
	  "text": "Recently, France has reduced funding for public transportation in favor of expanding highway infrastructure. Does this reduction contribute to lower CO2 emissions?",
	  "effects": {
		"Yes": { "GDP": -22, "R&D": -0.9, "CarValue": 5 },
		"No": { "GDP": 0, "R&D": 0.3, "CarValue": -4 }
	  },
	  "output": {
		"Yes": "Incorrect. Reducing funding for public transportation tends to increase CO2 emissions.",
		"No": "Correct! The reduction does not contribute to lowering CO2 emissions."
	  }
	},
	{
	  "text": "Last month, France implemented a free public charging network for electric cars nationwide. Does this implementation lead to higher research and development (R&D) investments in the automotive sector?",
	  "effects": {
		"Yes": { "GDP": -6, "R&D": 0.7, "CarValue": -2 },
		"No": { "GDP": 0, "R&D": -0.3, "CarValue": 3 }
	  },
	  "output": {
		"Yes": "Correct! The free charging network encourages more R&D investments in the automotive sector.",
		"No": "Incorrect. The implementation actually leads to higher R&D investments."
	  }
	}
  ],


"Cement": [
	{
		"text": "In the past month, has France introduced new standards for cement manufacturing to decrease carbon dioxide emissions?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.7, "CementValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "CementValue": 4 }
		},
		"output": {
			"Yes": "Correct! France has indeed introduced new standards for cement manufacturing, leading to reduced CO2 emissions and promoting research in low-carbon technologies, albeit with some economic costs.",
			"No": "Incorrect. France has actually introduced new standards for cement manufacturing to decrease carbon dioxide emissions."
		}
	},
	{
		"text": "Recently, has the French government invested in research and development for low-carbon cement technologies?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.8, "CementValue": -4 },
			"No": { "GDP": 0, "R&D": -0.6, "CementValue": 3 }
		},
		"output": {
			"Yes": "Correct! The French government has increased investment in R&D for low-carbon cement technologies, which helps reduce emissions and fosters innovation.",
			"No": "Incorrect. The French government has actually invested in research and development for low-carbon cement technologies."
		}
	},
	{
		"text": "Over the last two weeks, has France reduced its cement production quotas to mitigate climate change?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 0.5, "CementValue": -2 },
			"No": { "GDP": 0, "R&D": -0.3, "CementValue": 5 }
		},
		"output": {
			"Yes": "Correct! France has reduced cement production quotas as part of its strategy to mitigate climate change, which affects the economy and reduces CO2 emissions.",
			"No": "Incorrect. France has actually reduced its cement production quotas to help mitigate climate change."
		}
	},
	{
		"text": "In the last few days, has France implemented a carbon tax specifically targeting the cement industry?",
		"effects": {
			"Yes": { "GDP": -25, "R&D": 0.9, "CementValue": -5 },
			"No": { "GDP": 0, "R&D": -0.8, "CementValue": 2 }
		},
		"output": {
			"Yes": "Correct! France has implemented a carbon tax for the cement industry, which contributes to lowering emissions and funding research, though it impacts economic output.",
			"No": "Incorrect. France has actually implemented a carbon tax specifically targeting the cement industry."
		}
	},
	{
		"text": "This month, has France launched initiatives to promote the use of alternative materials in cement production to lower emissions?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": 0.6, "CementValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "CementValue": 4 }
		},
		"output": {
			"Yes": "Correct! France has launched initiatives to encourage the use of alternative materials in cement production, helping to reduce emissions and supporting research efforts.",
			"No": "Incorrect. France has actually launched initiatives to promote the use of alternative materials in cement production to lower emissions."
		}
	},
	{
		"text": "A few days ago, did France completely ban cement production to stop all CO2 emissions?",
		"effects": {
			"Yes": { "GDP": 0, "R&D": -0.7, "CementValue": 4 },
			"No": { "GDP": -18, "R&D": 0.4, "CementValue": -3 }
		},
		"output": {
			"Yes": "Incorrect. France has not completely banned cement production; such a measure would have significant economic impacts.",
			"No": "Correct! France has not completely banned cement production, allowing for controlled emissions reductions without halting the industry entirely."
		}
	},
	{
		"text": "Last week, has France decided to ignore climate change concerns in its cement industry policies?",
		"effects": {
			"Yes": { "GDP": 0, "R&D": -0.5, "CementValue": 3 },
			"No": { "GDP": -10, "R&D": 0.7, "CementValue": -2 }
		},
		"output": {
			"Yes": "Incorrect. France continues to address climate change concerns in its cement industry policies.",
			"No": "Correct! France has not ignored climate change concerns and continues to implement policies to reduce emissions from the cement industry."
		}
	},
	{
		"text": "Recently, did France remove all subsidies for green cement technologies?",
		"effects": {
			"Yes": { "GDP": 0, "R&D": -0.2, "CementValue": 2 },
			"No": { "GDP": -8, "R&D": 0.3, "CementValue": -4 }
		},
		"output": {
			"Yes": "Incorrect. France has not removed all subsidies for green cement technologies; it continues to support sustainable practices.",
			"No": "Correct! France has maintained subsidies for green cement technologies to promote sustainable development and reduce emissions."
		}
	},
	{
		"text": "In the past month, has France doubled its cement production without regard to environmental impacts?",
		"effects": {
			"Yes": { "GDP": 0, "R&D": -0.6, "CementValue": 5 },
			"No": { "GDP": -20, "R&D": 0.5, "CementValue": -2 }
		},
		"output": {
			"Yes": "Incorrect. France has not doubled its cement production without considering environmental impacts; efforts are being made to balance production with sustainability.",
			"No": "Correct! France has not doubled its cement production without regard to environmental impacts, ensuring sustainable practices are followed."
		}
	},
	{
		"text": "Last few days, has France halted all research into sustainable cement alternatives?",
		"effects": {
			"Yes": { "GDP": 0, "R&D": -0.9, "CementValue": 3 },
			"No": { "GDP": -15, "R&D": 0.8, "CementValue": -5 }
		},
		"output": {
			"Yes": "Incorrect. France has not halted research into sustainable cement alternatives; it continues to invest in developing eco-friendly materials.",
			"No": "Correct! France has not halted research into sustainable cement alternatives and remains committed to finding environmentally friendly solutions."
		}
	}
],

"Metal" : [
	{
		"text": "Last week, the French government announced a significant investment in sustainable metal mining practices. Is this investment aimed at reducing carbon emissions?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.8, "MetalValue": -3 },
			"No": { "GDP": 0, "R&D": -0.5, "MetalValue": 4 }
		},
		"output": {
			"Yes": "Correct! The investment is indeed focused on lowering carbon emissions through sustainable practices.",
			"No": "Incorrect. The investment is actually intended to reduce carbon emissions by promoting sustainable metal mining."
		}
	},
	{
		"text": "A few days ago, a report emerged claiming that France has halted all research and development in metal recycling. Is this information accurate?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 3, "MetalValue": -2 },
			"No": { "GDP": 0, "R&D": 0.6, "MetalValue": -4 }
		},
		"output": {
			"Yes": "Incorrect. France has not halted R&D in metal recycling; in fact, efforts are ongoing to enhance recycling technologies.",
			"No": "Correct! France continues to invest in research and development for metal recycling."
		}
	},
	{
		"text": "Two weeks ago, France implemented new tariffs on imported metals to support local industries. Does this policy lead to a decrease in GDP?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": 0.3, "MetalValue": -5 },
			"No": { "GDP": 0, "R&D": -0.7, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct. The new tariffs may negatively impact GDP by increasing costs for industries relying on imported metals.",
			"No": "Incorrect. The tariffs are expected to decrease GDP by making metal imports more expensive."
		}
	},
	{
		"text": "Recently, France has reported a surge in metal exports due to high global demand. Is this surge contributing to a reduction in national CO2 emissions?",
		"effects": {
			"Yes": { "GDP": -5, "R&D": 0.5, "MetalValue": -2 },
			"No": { "GDP": 0, "R&D": -0.2, "MetalValue": 5 }
		},
		"output": {
			"Yes": "Incorrect. While exports have surged, they have not directly led to a reduction in national CO2 emissions.",
			"No": "Correct. The increase in metal exports does not contribute to lowering France's CO2 emissions."
		}
	},
	{
		"text": "Last month, a new regulation was introduced in France to limit the use of certain metals in manufacturing. Does this regulation result in increased research and development in the metal sector?",
		"effects": {
			"Yes": { "GDP": -8, "R&D": 0.9, "MetalValue": -3 },
			"No": { "GDP": 0, "R&D": -0.4, "MetalValue": 2 }
		},
		"output": {
			"Yes": "Correct! The regulation has spurred increased R&D to find alternative materials and more efficient processes.",
			"No": "Incorrect. The regulation has actually led to a rise in research and development within the metal sector."
		}
	},
	{
		"text": "In the past few days, rumors have circulated that France is considering banning all metal exports to prioritize domestic needs. Is this ban officially confirmed?",
		"effects": {
			"Yes": { "GDP": -12, "R&D": -0.6, "MetalValue": 4 },
			"No": { "GDP": 0, "R&D": 0.7, "MetalValue": -3 }
		},
		"output": {
			"Yes": "Incorrect. There has been no official confirmation of a ban on metal exports in France.",
			"No": "Correct! The rumors are unfounded, and no such export ban has been officially announced."
		}
	},
	{
		"text": "A recent study released last week shows that France has successfully reduced its metal-related CO2 emissions by 4% over the past year. Is this reduction a result of new environmental policies?",
		"effects": {
			"Yes": { "GDP": -18, "R&D": 0.4, "MetalValue": -4 },
			"No": { "GDP": 0, "R&D": -0.3, "MetalValue": 5 }
		},
		"output": {
			"Yes": "Correct! The reduction in CO2 emissions is attributed to the implementation of new environmental policies targeting the metal industry.",
			"No": "Incorrect. The decrease in CO2 emissions is indeed due to recent environmental policies."
		}
	},
	{
		"text": "Recently, France has decided to eliminate all subsidies for metal production industries. Does this elimination lead to a decrease in GDP?",
		"effects": {
			"Yes": { "GDP": -22, "R&D": 0.2, "MetalValue": -5 },
			"No": { "GDP": 0, "R&D": -0.8, "MetalValue": 3 }
		},
		"output": {
			"Yes": "Correct. Removing subsidies can negatively impact GDP by increasing production costs for metal industries.",
			"No": "Incorrect. The elimination of subsidies is expected to decrease GDP by raising costs for metal producers."
		}
	},
	{
		"text": "A few days ago, it was reported that France has doubled its investment in metal recycling technologies. Is this investment purely aimed at economic growth without considering environmental impacts?",
		"effects": {
			"Yes": { "GDP": -7, "R&D": -0.5, "MetalValue": 4 },
			"No": { "GDP": 0, "R&D": 0.9, "MetalValue": -2 }
		},
		"output": {
			"Yes": "Incorrect. The investment in metal recycling technologies is intended to address both economic growth and environmental sustainability.",
			"No": "Correct! The investment aims to balance economic growth with positive environmental impacts."
		}
	},
	{
		"text": "Last month, France introduced incentives for companies to use more recycled metals in their products. Does this initiative result in no change to the country's CO2 emissions?",
		"effects": {
			"Yes": { "GDP": -9, "R&D": -0.2, "MetalValue": 3 },
			"No": { "GDP": 0, "R&D": 0.6, "MetalValue": -4 }
		},
		"output": {
			"Yes": "Incorrect. Using more recycled metals contributes to a reduction in CO2 emissions.",
			"No": "Correct! The initiative leads to a decrease in CO2 emissions by promoting the use of recycled metals."
		}
	}
],

"Nuclear": [
	{
		"text": "In the past week, the French government announced a new initiative to expand its nuclear energy infrastructure. Does this initiative aim to increase France's reliance on nuclear power?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": 0.8, "NuclearValue": -4 },
			"No": { "GDP": 0, "R&D": -0.5, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! The initiative is indeed aimed at increasing reliance on nuclear power.",
			"No": "Incorrect. The initiative is actually intended to increase France's reliance on nuclear power."
		}
	},
	{
		"text": "Last month, there were reports about France shutting down several nuclear reactors ahead of schedule. Is this move part of France's strategy to phase out nuclear energy?",
		"effects": {
			"Yes": { "GDP": 0, "R&D": 0.7, "NuclearValue": -2 },
			"No": { "GDP": -10, "R&D": -0.4, "NuclearValue": 5 }
		},
		"output": {
			"Yes": "Incorrect. The shutdowns are not part of a strategy to phase out nuclear energy.",
			"No": "Correct! The shutdowns are not intended to phase out nuclear energy."
		}
	},
	{
		"text": "Over the past few days, France has invested heavily in nuclear research and development projects. Does this investment aim to enhance renewable energy sources?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": -0.6, "NuclearValue": 4 },
			"No": { "GDP": 0, "R&D": 0.9, "NuclearValue": -3 }
		},
		"output": {
			"Yes": "Incorrect. The investment is focused on enhancing nuclear energy, not renewable sources.",
			"No": "Correct! The investment aims to enhance nuclear energy, not renewable sources."
		}
	},
	{
		"text": "A recent government report released yesterday highlights the benefits of maintaining France's current level of nuclear energy production. Is this report advocating for maintaining the status quo in nuclear energy?",
		"effects": {
			"Yes": { "GDP": -5, "R&D": 0.3, "NuclearValue": -2 },
			"No": { "GDP": 0, "R&D": -0.2, "NuclearValue": 3 }
		},
		"output": {
			"Yes": "Correct! The report advocates for maintaining the current level of nuclear energy production.",
			"No": "Incorrect. The report is actually advocating for maintaining the status quo in nuclear energy."
		}
	},
	{
		"text": "Recently, France has reduced subsidies for nuclear energy companies in an effort to diversify its energy portfolio. Does this reduction support the expansion of nuclear energy?",
		"effects": {
			"Yes": { "GDP": -25, "R&D": -1, "NuclearValue": 5 },
			"No": { "GDP": 0, "R&D": 0.5, "NuclearValue": -3 }
		},
		"output": {
			"Yes": "Incorrect. The reduction in subsidies does not support the expansion of nuclear energy.",
			"No": "Correct! The reduction in subsidies is intended to diversify France's energy portfolio away from nuclear energy."
		}
	},
	{
		"text": "In the last two weeks, France has launched a campaign to promote nuclear energy as a clean energy source. Is this campaign intended to improve the country's environmental footprint?",
		"effects": {
			"Yes": { "GDP": -10, "R&D": 0.6, "NuclearValue": -3 },
			"No": { "GDP": 0, "R&D": -0.3, "NuclearValue": 2 }
		},
		"output": {
			"Yes": "Correct! The campaign aims to improve France's environmental footprint by promoting nuclear energy as clean.",
			"No": "Incorrect. The campaign is indeed intended to improve the country's environmental footprint."
		}
	},
	{
		"text": "Last month, France decided to halt all new nuclear energy projects indefinitely. Does this decision reflect a commitment to expanding nuclear energy?",
		"effects": {
			"Yes": { "GDP": -20, "R&D": -0.8, "NuclearValue": 4 },
			"No": { "GDP": 0, "R&D": 0.7, "NuclearValue": -2 }
		},
		"output": {
			"Yes": "Incorrect. Halting new projects does not reflect a commitment to expanding nuclear energy.",
			"No": "Correct! The decision to halt new projects indicates a lack of commitment to expanding nuclear energy."
		}
	},
	{
		"text": "A few days ago, the French Ministry of Energy announced increased funding for nuclear safety measures. Does this increase in funding suggest that France is scaling back its nuclear energy programs?",
		"effects": {
			"Yes": { "GDP": -15, "R&D": -0.5, "NuclearValue": 3 },
			"No": { "GDP": 0, "R&D": 0.4, "NuclearValue": -2 }
		},
		"output": {
			"Yes": "Incorrect. The increased funding is meant to enhance safety, not scale back nuclear programs.",
			"No": "Correct! The funding increase is intended to improve safety measures, not reduce nuclear energy programs."
		}
	},
	{
		"text": "Recently, France has been debating the benefits of nuclear energy in its national parliament. Is this debate centered around phasing out nuclear power entirely?",
		"effects": {
			"Yes": { "GDP": -5, "R&D": 0.2, "NuclearValue": -1 },
			"No": { "GDP": 0, "R&D": -0.1, "NuclearValue": 2 }
		},
		"output": {
			"Yes": "Incorrect. The debate is not solely about phasing out nuclear power entirely.",
			"No": "Correct! The debate covers various aspects of nuclear energy, not just its complete phase-out."
		}
	},
	{
		"text": "In the past few days, France has signed an agreement with neighboring countries to share nuclear technology. Does this agreement indicate a move towards reducing nuclear energy collaboration?",
		"effects": {
			"Yes": { "GDP": -25, "R&D": -1, "NuclearValue": 5 },
			"No": { "GDP": 0, "R&D": 0.9, "NuclearValue": -4 }
		},
		"output": {
			"Yes": "Incorrect. The agreement actually enhances nuclear energy collaboration rather than reducing it.",
			"No": "Correct! The agreement signifies increased collaboration in nuclear technology among neighboring countries."
		}
	}
]

}
