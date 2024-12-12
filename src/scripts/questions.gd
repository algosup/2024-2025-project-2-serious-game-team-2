extends Node


const QUESTIONS = {
	"Bus": [
	{
		"text": "Over the past week, the French government has launched a new initiative to upgrade the national bus fleet to electric vehicles. Has France officially adopted this plan?",
		"effects": {
			"Yes": { "GDP": -2.0, "R&D": 2.0, "Emissions": -1.8 },
			"No": { "GDP": -1.0, "R&D": -0.5, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Great! Transitioning to electric buses will boost the economy, enhance research and development, and significantly reduce emissions.",
			"No": "Unfortunately, without adopting the plan, economic growth and R&D may decline, and emissions could increase."
		}
	},
	{
		"text": "Recently, there has been a proposal to implement stricter emission standards for public buses across France. Has this proposal been approved?",
		"effects": {
			"Yes": { "GDP": -0.8, "R&D": 1.2, "Emissions": -2.0 },
			"No": { "GDP": 0.5, "R&D": -1.5, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Stricter emission standards are in place! This will foster innovation in R&D and lead to cleaner air, though it may slightly impact GDP.",
			"No": "The proposal was rejected, which may hinder R&D progress and lead to higher emissions, but could provide a short-term boost to GDP."
		}
	},
	{
		"text": "In the last few days, France has allocated additional funds for the maintenance of its bus infrastructure. Has this funding been approved by the government?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 0.5, "Emissions": -0.5 },
			"No": { "GDP": -1.2, "R&D": -0.3, "Emissions": 0.7 }
		},
		"output": {
			"Yes": "Funding approved! Improved bus infrastructure will stimulate economic growth and slightly reduce emissions.",
			"No": "Funding was denied, potentially slowing economic growth and increasing emissions due to neglected infrastructure."
		}
	},
	{
		"text": "A recent survey indicates strong public support for expanding bus services in rural areas of France. Has the government decided to act on this support?",
		"effects": {
			"Yes": { "GDP": 1.3, "R&D": 1.0, "Emissions": -1.0 },
			"No": { "GDP": -0.7, "R&D": -0.8, "Emissions": 0.9 }
		},
		"output": {
			"Yes": "Expansion underway! Enhancing bus services will drive economic activity, boost R&D, and help lower emissions.",
			"No": "No action taken, which may stifle economic opportunities and lead to higher emissions in rural areas."
		}
	},
	{
		"text": "France has introduced a new tax incentive for companies investing in sustainable bus technologies this month. Has this incentive been implemented?",
		"effects": {
			"Yes": { "GDP": 0.8, "R&D": 2.0, "Emissions": -0.8 },
			"No": { "GDP": -0.5, "R&D": -1.0, "Emissions": 1.0 }
		},
		"output": {
			"Yes": "Tax incentives are in place! This will encourage investment in sustainable technologies, boosting R&D and reducing emissions.",
			"No": "The incentive was not implemented, potentially discouraging investment and leading to higher emissions."
		}
	},
	{
		"text": "In recent days, there has been a crackdown on diesel buses to meet France's climate goals. Has the government restricted diesel buses in major cities?",
		"effects": {
			"Yes": { "GDP": -1.0, "R&D": 1.5, "Emissions": -2.0 },
			"No": { "GDP": 0.6, "R&D": -1.2, "Emissions": 1.8 }
		},
		"output": {
			"Yes": "Diesel buses restricted! This move will significantly reduce emissions and promote R&D in cleaner technologies, though it may slightly impact GDP.",
			"No": "No restrictions on diesel buses, which could lead to increased emissions and hinder advancements in sustainable technologies."
		}
	},
	{
		"text": "A new pilot program for hydrogen-powered buses has been launched in France this week. Has the government officially endorsed this program?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 2.0, "Emissions": -1.5 },
			"No": { "GDP": -0.9, "R&D": -0.7, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Hydrogen buses are supported! This initiative will enhance economic growth, drive R&D, and help lower emissions.",
			"No": "The pilot program lacks government support, potentially limiting economic and technological advancements and maintaining higher emission levels."
		}
	},
	{
		"text": "France has set a deadline to phase out all fossil fuel buses by 2030. Has this deadline been officially confirmed?",
		"effects": {
			"Yes": { "GDP": -1.5, "R&D": 1.8, "Emissions": -2.0 },
			"No": { "GDP": 1.0, "R&D": -1.5, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Deadline confirmed! Phasing out fossil fuel buses will drive R&D and significantly reduce emissions, though it may challenge GDP.",
			"No": "Without a confirmed deadline, the transition to sustainable buses may slow, affecting R&D progress and keeping emissions high."
		}
	},
	{
		"text": "In the last month, France has increased subsidies for electric bus manufacturers. Have these subsidies been officially announced?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 2.0, "Emissions": -1.0 },
			"No": { "GDP": -0.6, "R&D": -1.0, "Emissions": 0.8 }
		},
		"output": {
			"Yes": "Subsidies granted! This support will boost the economy, enhance R&D efforts, and help reduce emissions.",
			"No": "No subsidies announced, which may hinder economic growth and R&D initiatives, leading to higher emissions."
		}
	},
	{
		"text": "A recent government report suggests that expanding bus lanes can improve efficiency. Has France implemented more bus lanes nationwide?",
		"effects": {
			"Yes": { "GDP": 0.9, "R&D": 0.7, "Emissions": -0.9 },
			"No": { "GDP": -0.4, "R&D": -0.6, "Emissions": 0.6 }
		},
		"output": {
			"Yes": "More bus lanes added! This will enhance economic productivity, support R&D, and contribute to lower emissions.",
			"No": "No expansion of bus lanes, which might limit economic efficiency and maintain higher emission levels."
		}
	},
	{
		"text": "France has initiated a training program for electric bus maintenance technicians this week. Has this program been launched?",
		"effects": {
			"Yes": { "GDP": 0.7, "R&D": 1.5, "Emissions": -0.7 },
			"No": { "GDP": -0.3, "R&D": -1.3, "Emissions": 0.5 }
		},
		"output": {
			"Yes": "Training program launched! This will support economic growth, advance R&D, and help reduce emissions.",
			"No": "The training program was not launched, potentially slowing economic and technological progress and keeping emissions steady."
		}
	},
	{
		"text": "In recent days, France has collaborated with tech firms to develop smart bus systems. Has this collaboration been officially confirmed?",
		"effects": {
			"Yes": { "GDP": 1.4, "R&D": 2.0, "Emissions": -1.2 },
			"No": { "GDP": -0.8, "R&D": -1.0, "Emissions": 1.0 }
		},
		"output": {
			"Yes": "Collaboration confirmed! Partnering with tech firms will drive economic growth, boost R&D, and help lower emissions.",
			"No": "No collaboration established, which may limit economic and technological advancements and maintain emission levels."
		}
	},
	{
		"text": "France has introduced a mandatory retrofit program for older buses to meet new emission standards. Has this program been enforced?",
		"effects": {
			"Yes": { "GDP": -1.2, "R&D": 1.7, "Emissions": -2.0 },
			"No": { "GDP": 0.5, "R&D": -1.2, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Retrofit program enforced! This will drive R&D and significantly reduce emissions, though it may slightly impact GDP.",
			"No": "Without enforcement, older buses remain a source of higher emissions, and R&D may not advance as needed."
		}
	},
	{
		"text": "A new tax on high-emission buses was proposed last week. Has France implemented this tax?",
		"effects": {
			"Yes": { "GDP": -0.9, "R&D": 1.3, "Emissions": -1.5 },
			"No": { "GDP": 0.7, "R&D": -0.9, "Emissions": 1.1 }
		},
		"output": {
			"Yes": "High-emission bus tax implemented! This will encourage R&D, reduce emissions, but may slightly affect GDP.",
			"No": "The tax was not implemented, potentially discouraging R&D efforts and keeping emissions higher."
		}
	},
	{
		"text": "France has allocated funds for research into autonomous bus technologies this month. Has this funding been approved?",
		"effects": {
			"Yes": { "GDP": 1.1, "R&D": 2.0, "Emissions": -0.8 },
			"No": { "GDP": -0.5, "R&D": -1.4, "Emissions": 0.9 }
		},
		"output": {
			"Yes": "Funding approved! Investment in autonomous buses will boost the economy, enhance R&D, and help reduce emissions.",
			"No": "Funding was not approved, potentially hindering economic growth and R&D advancements, and keeping emissions steady."
		}
	},
	{
		"text": "A recent environmental assessment recommends increasing the frequency of electric buses in urban areas. Has France adopted this recommendation?",
		"effects": {
			"Yes": { "GDP": 0.8, "R&D": 1.6, "Emissions": -1.3 },
			"No": { "GDP": -0.6, "R&D": -1.1, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Recommendation adopted! Increasing electric bus frequency will support economic growth, boost R&D, and lower emissions.",
			"No": "The recommendation was not adopted, which may negatively impact economic and technological progress and maintain higher emissions."
		}
	},
	{
		"text": "France has started a public-private partnership to develop next-generation bus technologies this week. Has this partnership been officially formed?",
		"effects": {
			"Yes": { "GDP": 1.3, "R&D": 2.0, "Emissions": -1.0 },
			"No": { "GDP": -0.7, "R&D": -1.2, "Emissions": 1.0 }
		},
		"output": {
			"Yes": "Partnership formed! This collaboration will drive economic growth, enhance R&D, and contribute to emission reductions.",
			"No": "No partnership established, potentially limiting economic and technological advancements and keeping emissions higher."
		}
	},
	{
		"text": "In the past few days, France has reviewed its subsidies for hybrid buses. Has the subsidy rate been increased?",
		"effects": {
			"Yes": { "GDP": 0.9, "R&D": 1.8, "Emissions": -1.5 },
			"No": { "GDP": -0.5, "R&D": -1.0, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Subsidy rates increased! This will encourage R&D, boost the economy, and help reduce emissions.",
			"No": "Subsidy rates were not increased, which may hinder R&D efforts and maintain higher emission levels."
		}
	},
	{
		"text": "France has announced a partnership with European neighbors to standardize bus emission controls. Has this agreement been signed?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.5, "Emissions": -2.0 },
			"No": { "GDP": -0.8, "R&D": -1.3, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Agreement signed! Standardizing emission controls will drive R&D, boost the economy, and significantly reduce emissions.",
			"No": "No agreement signed, potentially limiting R&D progress and maintaining higher emissions levels."
		}
	},
	{
		"text": "A new regulation mandates the use of renewable energy sources for all public buses in France. Has this regulation been enforced?",
		"effects": {
			"Yes": { "GDP": -1.1, "R&D": 1.9, "Emissions": -2.0 },
			"No": { "GDP": 0.6, "R&D": -1.5, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Regulation enforced! Transitioning to renewable energy will enhance R&D and significantly lower emissions, though it may impact GDP.",
			"No": "Without enforcement, buses may continue using non-renewable sources, hindering R&D and keeping emissions high."
		}
	},
	{
		"text": "France has launched a campaign to promote the use of electric buses among commuters this month. Has this campaign been initiated?",
		"effects": {
			"Yes": { "GDP": 0.7, "R&D": 1.4, "Emissions": -1.0 },
			"No": { "GDP": -0.4, "R&D": -0.9, "Emissions": 0.8 }
		},
		"output": {
			"Yes": "Campaign launched! Promoting electric buses will support economic growth, boost R&D, and help reduce emissions.",
			"No": "The campaign was not initiated, which may limit economic and technological advancements and maintain higher emissions."
		}
	},
	{
		"text": "A new grant for startups developing sustainable bus technologies was announced in France this week. Has this grant been made available?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 2.0, "Emissions": -1.5 },
			"No": { "GDP": -0.7, "R&D": -1.2, "Emissions": 1.1 }
		},
		"output": {
			"Yes": "Grant available! This support will drive economic growth, enhance R&D, and contribute to emission reductions.",
			"No": "No grant was made available, potentially hindering economic and technological progress and maintaining higher emissions."
		}
	},
	{
		"text": "France has updated its public transportation guidelines to prioritize low-emission buses this month. Have these guidelines been officially adopted?",
		"effects": {
			"Yes": { "GDP": 0.8, "R&D": 1.6, "Emissions": -1.4 },
			"No": { "GDP": -0.5, "R&D": -1.0, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Guidelines adopted! Prioritizing low-emission buses will support economic growth, boost R&D, and help lower emissions.",
			"No": "The guidelines were not adopted, which may negatively impact economic and technological advancements and maintain higher emissions."
		}
	},
	{
		"text": "In the last few days, France has introduced a new certification for eco-friendly buses. Has this certification process begun?",
		"effects": {
			"Yes": { "GDP": 0.6, "R&D": 1.3, "Emissions": -0.9 },
			"No": { "GDP": -0.3, "R&D": -0.8, "Emissions": 0.7 }
		},
		"output": {
			"Yes": "Certification process started! This initiative will encourage R&D, support the economy, and contribute to emission reductions.",
			"No": "The certification process has not begun, potentially limiting R&D efforts and maintaining higher emission levels."
		}
	},
	{
		"text": "France has proposed a ban on single-use diesel bus parts to promote sustainability. Has this ban been enacted?",
		"effects": {
			"Yes": { "GDP": -1.0, "R&D": 1.7, "Emissions": -1.8 },
			"No": { "GDP": 0.5, "R&D": -1.1, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Ban enacted! This will drive R&D, significantly reduce emissions, but may slightly affect GDP.",
			"No": "The ban was not enacted, potentially hindering R&D progress and maintaining higher emissions levels."
		}
	},
	{
		"text": "A new initiative to recycle old bus components was launched in France this month. Has the initiative been officially started?",
		"effects": {
			"Yes": { "GDP": 0.9, "R&D": 1.5, "Emissions": -1.0 },
			"No": { "GDP": -0.6, "R&D": -1.0, "Emissions": 0.9 }
		},
		"output": {
			"Yes": "Recycling initiative started! This will support economic growth, boost R&D, and help reduce emissions.",
			"No": "The initiative was not started, which may limit economic and technological advancements and maintain higher emissions."
		}
	},
	{
		"text": "France has enhanced its regulatory framework to support the deployment of electric buses. Has this framework been implemented?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.8, "Emissions": -1.5 },
			"No": { "GDP": -0.7, "R&D": -1.3, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Regulatory framework implemented! This will drive economic growth, enhance R&D, and contribute to emission reductions.",
			"No": "The framework was not implemented, potentially hindering economic and technological progress and maintaining higher emissions."
		}
	},
	{
		"text": "A national competition for innovative bus design was announced in France this week. Has this competition been officially launched?",
		"effects": {
			"Yes": { "GDP": 1.1, "R&D": 2.0, "Emissions": -1.2 },
			"No": { "GDP": -0.8, "R&D": -1.4, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Competition launched! This will stimulate economic growth, drive R&D, and help reduce emissions.",
			"No": "The competition was not launched, which may limit economic and technological advancements and maintain higher emissions."
		}
	},
	{
		"text": "France has set up a task force to evaluate the impact of bus electrification on the economy. Has this task force been established?",
		"effects": {
			"Yes": { "GDP": 0.7, "R&D": 1.5, "Emissions": -1.0 },
			"No": { "GDP": -0.4, "R&D": -0.9, "Emissions": 0.8 }
		},
		"output": {
			"Yes": "Task force established! This will support economic analysis, boost R&D, and contribute to emission reductions.",
			"No": "The task force was not established, potentially hindering economic and technological assessments and maintaining higher emissions."
		}
	},
	{
		"text": "A government grant for upgrading bus depots to accommodate electric buses was announced recently. Has this grant been distributed?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.8, "Emissions": -1.5 },
			"No": { "GDP": -0.6, "R&D": -1.1, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Grant distributed! Upgrading depots will drive economic growth, enhance R&D, and help reduce emissions.",
			"No": "The grant was not distributed, which may limit economic and technological advancements and maintain higher emissions."
		}
	},
	{
		"text": "France has implemented a digital tracking system for bus emissions this month. Has this system been put into effect?",
		"effects": {
			"Yes": { "GDP": 0.8, "R&D": 1.6, "Emissions": -1.4 },
			"No": { "GDP": -0.5, "R&D": -1.0, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Digital tracking system in place! This will support economic growth, boost R&D, and help lower emissions.",
			"No": "The system was not implemented, potentially hindering economic and technological progress and maintaining higher emissions."
		}
	},
	{
		"text": "A new environmental tax on bus companies was introduced in France last week. Has this tax been enforced?",
		"effects": {
			"Yes": { "GDP": -1.0, "R&D": 1.7, "Emissions": -1.8 },
			"No": { "GDP": 0.5, "R&D": -1.2, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Environmental tax enforced! This will encourage R&D, reduce emissions, but may slightly impact GDP.",
			"No": "The tax was not enforced, potentially discouraging R&D efforts and maintaining higher emission levels."
		}
	},
	{
		"text": "France has partnered with universities to research sustainable bus fuels this month. Has this partnership been officially announced?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 2.0, "Emissions": -1.5 },
			"No": { "GDP": -0.7, "R&D": -1.3, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Partnership announced! Collaborating with universities will drive economic growth, enhance R&D, and help reduce emissions.",
			"No": "The partnership was not announced, potentially limiting economic and technological advancements and maintaining higher emissions."
		}
	},
	{
		"text": "A new subsidy program for retrofitting buses with green technologies was launched in France this week. Has this program been initiated?",
		"effects": {
			"Yes": { "GDP": 0.9, "R&D": 1.5, "Emissions": -1.0 },
			"No": { "GDP": -0.5, "R&D": -1.0, "Emissions": 0.9 }
		},
		"output": {
			"Yes": "Subsidy program initiated! Retrofitting buses will support economic growth, boost R&D, and help reduce emissions.",
			"No": "The subsidy program was not initiated, which may hinder economic and technological progress and maintain higher emissions."
		}
	},
	{
		"text": "France has set up an innovation hub focused on sustainable bus design this month. Has this hub been officially opened?",
		"effects": {
			"Yes": { "GDP": 1.3, "R&D": 2.0, "Emissions": -1.2 },
			"No": { "GDP": -0.8, "R&D": -1.4, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Innovation hub opened! This will drive economic growth, enhance R&D, and contribute to emission reductions.",
			"No": "The hub was not opened, potentially limiting economic and technological advancements and maintaining higher emissions."
		}
	},
	{
		"text": "A new regulation requires all new buses in France to meet specific energy efficiency standards. Has this regulation been enacted?",
		"effects": {
			"Yes": { "GDP": -1.1, "R&D": 1.9, "Emissions": -2.0 },
			"No": { "GDP": 0.6, "R&D": -1.5, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Regulation enacted! Meeting energy efficiency standards will drive R&D and significantly reduce emissions, though it may impact GDP.",
			"No": "Without the regulation, buses may continue to be less energy-efficient, hindering R&D and maintaining higher emissions."
		}
	},
	{
		"text": "France has initiated a fleet renewal program to replace old buses with eco-friendly models this month. Has this program begun?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.8, "Emissions": -1.5 },
			"No": { "GDP": -0.6, "R&D": -1.1, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Fleet renewal program begun! Replacing old buses will support economic growth, boost R&D, and help reduce emissions.",
			"No": "The program has not begun, which may limit economic and technological advancements and maintain higher emissions."
		}
	}
],



"Car" : [
	{
	  "text": "Over the past week, the French government has introduced incentives for electric vehicle purchases. Do you support this initiative?",
	  "effects": {
		"Yes": { "GDP": 1.5, "R&D": 1.0, "Emissions": -1.8 },
		"No": { "GDP": -1.2, "R&D": -0.8, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Great choice! Supporting electric vehicles boosts the economy, encourages innovation, and reduces emissions.",
		"No": "Opting out may slow economic growth, hinder research advancements, and keep emissions levels high."
	  }
	},
	{
	  "text": "Recently, a new tax on diesel cars has been proposed in France. Do you agree with implementing this tax?",
	  "effects": {
		"Yes": { "GDP": -0.5, "R&D": 1.2, "Emissions": -2.0 },
		"No": { "GDP": 0.3, "R&D": -1.0, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Implementing the tax helps reduce harmful emissions and promotes cleaner technologies, despite a slight economic dip.",
		"No": "Rejecting the tax might maintain economic stability but could lead to higher emissions and slower innovation."
	  }
	},
	{
	  "text": "In the last few days, a campaign to increase public charging stations for electric cars has been launched. Do you think this is beneficial?",
	  "effects": {
		"Yes": { "GDP": 1.0, "R&D": 1.5, "Emissions": -1.5 },
		"No": { "GDP": -0.8, "R&D": -1.3, "Emissions": 1.6 }
	  },
	  "output": {
		"Yes": "Supporting the campaign enhances economic growth, fosters research, and significantly lowers emissions.",
		"No": "Opposing the campaign may hinder economic progress, limit research opportunities, and keep emissions elevated."
	  }
	},
	{
	  "text": "A recent study shows that hybrid vehicles are becoming more popular in France. Should the government provide subsidies for hybrid car buyers?",
	  "effects": {
		"Yes": { "GDP": 1.2, "R&D": 1.0, "Emissions": -1.7 },
		"No": { "GDP": -1.0, "R&D": -0.9, "Emissions": 1.4 }
	  },
	  "output": {
		"Yes": "Subsidizing hybrids supports economic growth, encourages technological advancements, and reduces emissions.",
		"No": "Not providing subsidies might slow economic growth, limit innovation, and result in higher emission levels."
	  }
	},
	{
	  "text": "The French Ministry of Transport has proposed stricter emission standards for all new cars starting next month. Do you agree with this proposal?",
	  "effects": {
		"Yes": { "GDP": -0.7, "R&D": 1.8, "Emissions": -2.0 },
		"No": { "GDP": 0.5, "R&D": -1.5, "Emissions": 1.9 }
	  },
	  "output": {
		"Yes": "Agreeing to stricter standards may temporarily affect the economy but greatly boosts research and reduces emissions.",
		"No": "Disagreeing can maintain economic stability but may hinder innovation and keep emissions levels high."
	  }
	},
	{
	  "text": "Due to recent advancements, autonomous electric cars are set to enter the French market soon. Should the government invest in infrastructure to support them?",
	  "effects": {
		"Yes": { "GDP": 1.8, "R&D": 2.0, "Emissions": -1.6 },
		"No": { "GDP": -1.5, "R&D": -1.8, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Investing in infrastructure will drive economic growth, accelerate research, and help lower emissions.",
		"No": "Choosing not to invest may hinder economic progress, delay research, and result in higher emissions."
	  }
	},
	{
	  "text": "A new regulation requires all French car manufacturers to produce at least 30% electric vehicles by the end of the year. Do you support this regulation?",
	  "effects": {
		"Yes": { "GDP": -1.0, "R&D": 1.9, "Emissions": -1.8 },
		"No": { "GDP": 0.7, "R&D": -2.0, "Emissions": 1.9 }
	  },
	  "output": {
		"Yes": "Supporting the regulation may challenge the economy initially but promotes research and significantly cuts emissions.",
		"No": "Rejecting the regulation can sustain economic performance but may impede innovation and keep emissions high."
	  }
	},
	{
	  "text": "Recently, electric car battery recycling programs have been introduced in France. Do you believe these programs are essential?",
	  "effects": {
		"Yes": { "GDP": 0.8, "R&D": 1.3, "Emissions": -1.4 },
		"No": { "GDP": -0.6, "R&D": -1.2, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Supporting recycling programs boosts the economy, fosters research, and helps reduce emissions.",
		"No": "Opposing recycling initiatives might slow economic growth, limit research, and maintain higher emission levels."
	  }
	},
	{
	  "text": "A campaign has been launched to educate drivers about the benefits of carpooling to reduce emissions. Should the government fund this campaign?",
	  "effects": {
		"Yes": { "GDP": 0.5, "R&D": 0.7, "Emissions": -1.2 },
		"No": { "GDP": -0.4, "R&D": -0.5, "Emissions": 1.3 }
	  },
	  "output": {
		"Yes": "Funding the campaign supports economic activity, encourages modest research, and helps lower emissions.",
		"No": "Not funding the campaign may slightly hinder economic and research growth while keeping emissions unchanged."
	  }
	},
	{
	  "text": "In the past few days, a proposal to ban gasoline cars older than 10 years has been introduced in France. Do you support this ban?",
	  "effects": {
		"Yes": { "GDP": -1.3, "R&D": 2.0, "Emissions": -2.0 },
		"No": { "GDP": 0.6, "R&D": -1.7, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Supporting the ban may impact the economy but significantly advances research and reduces emissions.",
		"No": "Opposing the ban can preserve economic stability but may hinder innovation and keep emissions high."
	  }
	},
	{
	  "text": "A new initiative aims to convert traditional car factories to produce electric vehicles over the next six months. Do you think this is a positive move?",
	  "effects": {
		"Yes": { "GDP": 1.4, "R&D": 1.8, "Emissions": -1.9 },
		"No": { "GDP": -1.1, "R&D": -1.6, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Converting factories boosts the economy, fosters significant research, and greatly reduces emissions.",
		"No": "Choosing not to convert may hinder economic growth, limit research progress, and maintain higher emission levels."
	  }
	},
	{
	  "text": "France is considering offering tax breaks for companies that develop sustainable automotive technologies. Do you agree with this proposal?",
	  "effects": {
		"Yes": { "GDP": 1.0, "R&D": 2.0, "Emissions": -1.5 },
		"No": { "GDP": -0.7, "R&D": -1.9, "Emissions": 1.6 }
	  },
	  "output": {
		"Yes": "Agreeing to tax breaks stimulates the economy, accelerates research, and helps reduce emissions.",
		"No": "Rejecting tax breaks might slow economic growth, hinder research, and keep emissions levels elevated."
	  }
	},
	{
	  "text": "A recent week saw increased investment in public transportation to reduce reliance on cars. Should this investment continue?",
	  "effects": {
		"Yes": { "GDP": 1.2, "R&D": 0.9, "Emissions": -1.6 },
		"No": { "GDP": -0.9, "R&D": -0.8, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Continuing investment supports economic growth, modestly enhances research, and significantly cuts emissions.",
		"No": "Halting investment may slow economic progress, limit research advancements, and maintain higher emissions."
	  }
	},
	{
	  "text": "In the last few days, a proposal to implement congestion charges in major French cities to reduce car usage has been introduced. Do you support this proposal?",
	  "effects": {
		"Yes": { "GDP": -0.6, "R&D": 1.5, "Emissions": -1.7 },
		"No": { "GDP": 0.4, "R&D": -1.4, "Emissions": 1.6 }
	  },
	  "output": {
		"Yes": "Supporting congestion charges may slightly affect the economy but boosts research and lowers emissions.",
		"No": "Opposing the charges can preserve economic stability but may hinder research and keep emissions high."
	  }
	},
	{
	  "text": "A new law mandates that all new cars sold in France must meet the latest emission standards starting next month. Do you agree with this law?",
	  "effects": {
		"Yes": { "GDP": -1.0, "R&D": 2.0, "Emissions": -2.0 },
		"No": { "GDP": 0.5, "R&D": -2.0, "Emissions": 1.9 }
	  },
	  "output": {
		"Yes": "Agreeing to the law may challenge the economy initially but significantly advances research and reduces emissions.",
		"No": "Rejecting the law can maintain economic stability but may hinder innovation and keep emissions levels high."
	  }
	},
	{
	  "text": "Recently, subsidies for hydrogen fuel cell vehicles have been proposed in France. Do you support these subsidies?",
	  "effects": {
		"Yes": { "GDP": 1.3, "R&D": 1.7, "Emissions": -1.6 },
		"No": { "GDP": -1.2, "R&D": -1.8, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Supporting subsidies boosts the economy, fosters research, and helps reduce emissions.",
		"No": "Opposing subsidies may slow economic growth, limit research advancements, and maintain higher emission levels."
	  }
	},
	{
	  "text": "A new initiative encourages the use of car-sharing services to decrease the number of vehicles on the road. Should this initiative be promoted?",
	  "effects": {
		"Yes": { "GDP": 0.7, "R&D": 1.0, "Emissions": -1.3 },
		"No": { "GDP": -0.5, "R&D": -0.9, "Emissions": 1.4 }
	  },
	  "output": {
		"Yes": "Promoting car-sharing supports economic activity, encourages research, and helps lower emissions.",
		"No": "Not promoting car-sharing might slightly hinder economic and research growth while keeping emissions unchanged."
	  }
	},
	{
	  "text": "In the past week, France has seen a rise in the adoption of electric scooters and bikes to reduce car usage. Do you think this trend should be supported?",
	  "effects": {
		"Yes": { "GDP": 0.9, "R&D": 1.4, "Emissions": -1.2 },
		"No": { "GDP": -0.7, "R&D": -1.1, "Emissions": 1.3 }
	  },
	  "output": {
		"Yes": "Supporting this trend boosts the economy, fosters research, and helps reduce emissions.",
		"No": "Opposing the trend may slightly hinder economic and research growth while maintaining higher emission levels."
	  }
	},
	{
	  "text": "A recent proposal suggests increasing fuel efficiency standards for all vehicles in France. Do you agree with enhancing these standards?",
	  "effects": {
		"Yes": { "GDP": -0.8, "R&D": 1.6, "Emissions": -1.9 },
		"No": { "GDP": 0.6, "R&D": -1.6, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Agreeing to higher standards may impact the economy slightly but significantly boosts research and reduces emissions.",
		"No": "Rejecting higher standards can maintain economic stability but may hinder innovation and keep emissions levels high."
	  }
	},
	{
	  "text": "Recently, France has launched a program to retrofit older gasoline cars with emission-reducing technologies. Do you support this program?",
	  "effects": {
		"Yes": { "GDP": 0.5, "R&D": 1.2, "Emissions": -1.4 },
		"No": { "GDP": -0.4, "R&D": -1.0, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Supporting the retrofit program boosts the economy, encourages research, and helps lower emissions.",
		"No": "Opposing the program may slightly hinder economic and research growth while maintaining higher emission levels."
	  }
	},
	{
	  "text": "A new initiative proposes to develop solar-powered charging stations for electric cars across France. Do you think this initiative is worthwhile?",
	  "effects": {
		"Yes": { "GDP": 1.5, "R&D": 1.9, "Emissions": -1.8 },
		"No": { "GDP": -1.3, "R&D": -1.7, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Supporting solar-powered charging stations drives economic growth, fosters significant research, and reduces emissions.",
		"No": "Rejecting the initiative may hinder economic progress, limit research advancements, and maintain higher emission levels."
	  }
	},
	{
	  "text": "In the last few days, a proposal to implement a nationwide inspection program for vehicle emissions has been introduced. Do you support this proposal?",
	  "effects": {
		"Yes": { "GDP": -0.9, "R&D": 1.5, "Emissions": -1.7 },
		"No": { "GDP": 0.5, "R&D": -1.5, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Supporting the inspection program may slightly affect the economy but boosts research and lowers emissions.",
		"No": "Opposing the program can maintain economic stability but may hinder research and keep emissions levels high."
	  }
	},
	{
	  "text": "A recent initiative aims to promote the use of biofuels in French vehicles to reduce carbon emissions. Do you agree with promoting biofuels?",
	  "effects": {
		"Yes": { "GDP": 1.0, "R&D": 1.3, "Emissions": -1.5 },
		"No": { "GDP": -0.8, "R&D": -1.2, "Emissions": 1.6 }
	  },
	  "output": {
		"Yes": "Promoting biofuels supports economic growth, fosters research, and helps reduce emissions.",
		"No": "Opposing biofuel promotion may slow economic growth, limit research advancements, and maintain higher emission levels."
	  }
	},
	{
	  "text": "France is considering investing in hydrogen refueling infrastructure for cars over the next six months. Do you support this investment?",
	  "effects": {
		"Yes": { "GDP": 1.6, "R&D": 2.0, "Emissions": -1.9 },
		"No": { "GDP": -1.4, "R&D": -1.8, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Investing in hydrogen infrastructure drives economic growth, accelerates research, and reduces emissions.",
		"No": "Choosing not to invest may hinder economic progress, delay research, and maintain higher emission levels."
	  }
	},
	{
	  "text": "A new policy proposes offering free parking for electric vehicles to encourage their use. Do you agree with this policy?",
	  "effects": {
		"Yes": { "GDP": 0.8, "R&D": 1.1, "Emissions": -1.3 },
		"No": { "GDP": -0.6, "R&D": -1.0, "Emissions": 1.4 }
	  },
	  "output": {
		"Yes": "Agreeing to free parking supports economic activity, encourages research, and helps lower emissions.",
		"No": "Rejecting free parking might slightly hinder economic and research growth while keeping emissions unchanged."
	  }
	},
	{
	  "text": "In the past week, France has launched a subsidy program for research in electric vehicle technologies. Do you support this program?",
	  "effects": {
		"Yes": { "GDP": 1.4, "R&D": 2.0, "Emissions": -1.8 },
		"No": { "GDP": -1.2, "R&D": -2.0, "Emissions": 1.9 }
	  },
	  "output": {
		"Yes": "Supporting the subsidy program boosts the economy, accelerates research, and significantly reduces emissions.",
		"No": "Opposing the program may hinder economic growth, limit research advancements, and maintain higher emission levels."
	  }
	},
	{
	  "text": "A proposal has been made to integrate renewable energy sources into electric car charging stations across France. Do you agree with this integration?",
	  "effects": {
		"Yes": { "GDP": 1.3, "R&D": 1.7, "Emissions": -1.6 },
		"No": { "GDP": -1.1, "R&D": -1.8, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Agreeing to integrate renewables supports economic growth, fosters research, and helps reduce emissions.",
		"No": "Rejecting the integration may hinder economic progress, limit research advancements, and maintain higher emission levels."
	  }
	},
	{
	  "text": "Recently, a new app has been developed to optimize driving routes for better fuel efficiency. Should the government promote the use of such apps?",
	  "effects": {
		"Yes": { "GDP": 0.7, "R&D": 1.2, "Emissions": -1.1 },
		"No": { "GDP": -0.5, "R&D": -1.0, "Emissions": 1.2 }
	  },
	  "output": {
		"Yes": "Promoting the app supports economic activity, encourages research, and helps lower emissions.",
		"No": "Not promoting the app might slightly hinder economic and research growth while keeping emissions unchanged."
	  }
	},
	{
	  "text": "A new regulation requires all ride-sharing services in France to use electric vehicles. Do you support this regulation?",
	  "effects": {
		"Yes": { "GDP": -1.0, "R&D": 1.8, "Emissions": -1.9 },
		"No": { "GDP": 0.6, "R&D": -1.7, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Supporting the regulation may slightly impact the economy but significantly advances research and reduces emissions.",
		"No": "Opposing the regulation can maintain economic stability but may hinder innovation and keep emissions levels high."
	  }
	},
	{
	  "text": "In the last few days, France has initiated a program to convert school buses to electric models. Do you think this is a positive step?",
	  "effects": {
		"Yes": { "GDP": 0.9, "R&D": 1.5, "Emissions": -1.4 },
		"No": { "GDP": -0.7, "R&D": -1.3, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Supporting the conversion program boosts the economy, fosters research, and helps lower emissions.",
		"No": "Opposing the program may slightly hinder economic and research growth while maintaining higher emission levels."
	  }
	},
	{
	  "text": "A new tax incentive has been proposed for companies that produce low-emission vehicles in France. Do you agree with this incentive?",
	  "effects": {
		"Yes": { "GDP": 1.2, "R&D": 1.9, "Emissions": -1.7 },
		"No": { "GDP": -1.0, "R&D": -1.8, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Agreeing to the tax incentive supports economic growth, accelerates research, and significantly reduces emissions.",
		"No": "Rejecting the incentive may hinder economic progress, limit research advancements, and maintain higher emission levels."
	  }
	},
	{
	  "text": "Recently, France has started a pilot program for wireless electric vehicle charging in public areas. Do you support expanding this technology nationwide?",
	  "effects": {
		"Yes": { "GDP": 1.5, "R&D": 2.0, "Emissions": -1.9 },
		"No": { "GDP": -1.3, "R&D": -1.7, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Supporting wireless charging expansion drives economic growth, fosters significant research, and reduces emissions.",
		"No": "Rejecting the expansion may hinder economic progress, delay research, and maintain higher emission levels."
	  }
	},
	{
	  "text": "A new legislation proposes mandatory electric vehicle usage for all government fleets in France. Do you agree with this legislation?",
	  "effects": {
		"Yes": { "GDP": -1.1, "R&D": 1.8, "Emissions": -1.8 },
		"No": { "GDP": 0.7, "R&D": -1.6, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Agreeing to mandatory electric usage may slightly impact the economy but significantly boosts research and reduces emissions.",
		"No": "Rejecting the legislation can maintain economic stability but may hinder innovation and keep emissions levels high."
	  }
	},
	{
	  "text": "Over the past few days, a campaign to raise awareness about the environmental impact of car manufacturing has been launched in France. Do you support this campaign?",
	  "effects": {
		"Yes": { "GDP": 0.6, "R&D": 1.3, "Emissions": -1.2 },
		"No": { "GDP": -0.5, "R&D": -1.1, "Emissions": 1.3 }
	  },
	  "output": {
		"Yes": "Supporting the campaign boosts economic activity, encourages research, and helps lower emissions.",
		"No": "Opposing the campaign might slightly hinder economic and research growth while maintaining higher emission levels."
	  }
	},
	{
	  "text": "A new initiative encourages the development of lightweight materials for cars to improve fuel efficiency. Should this initiative be supported?",
	  "effects": {
		"Yes": { "GDP": 1.0, "R&D": 1.6, "Emissions": -1.5 },
		"No": { "GDP": -0.8, "R&D": -1.5, "Emissions": 1.6 }
	  },
	  "output": {
		"Yes": "Supporting lightweight materials development boosts the economy, fosters research, and helps reduce emissions.",
		"No": "Opposing the initiative may slow economic growth, limit research advancements, and maintain higher emission levels."
	  }
	},
	{
	  "text": "Recently, France has introduced a grant for startups developing sustainable automotive technologies. Do you support this grant?",
	  "effects": {
		"Yes": { "GDP": 1.4, "R&D": 2.0, "Emissions": -1.8 },
		"No": { "GDP": -1.2, "R&D": -2.0, "Emissions": 1.9 }
	  },
	  "output": {
		"Yes": "Supporting the grant boosts the economy, accelerates research, and significantly reduces emissions.",
		"No": "Rejecting the grant may hinder economic growth, limit research advancements, and maintain higher emission levels."
	  }
	}
  ],
"Cement": [
	{
	  "text": "In recent days, the French government has launched a new initiative to promote sustainable cement production. Is the implementation of carbon capture technology now mandatory for all cement factories?",
	  "effects": {
		"Yes": { "GDP": -0.5, "R&D": 1.2, "Emissions": -1.8 },
		"No": { "GDP": 0.3, "R&D": -1.0, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Correct! Mandating carbon capture technology helps reduce emissions and fosters innovation in the cement industry.",
		"No": "Incorrect. Implementing carbon capture technology is essential for lowering the cement industry's carbon footprint."
	  }
	},
	{
	  "text": "Over the past week, debates have intensified around the use of alternative fuels in cement production. Should French cement plants switch to renewable energy sources exclusively?",
	  "effects": {
		"Yes": { "GDP": -0.3, "R&D": 0.8, "Emissions": -1.2 },
		"No": { "GDP": 0.4, "R&D": -0.9, "Emissions": 1.3 }
	  },
	  "output": {
		"Yes": "Correct! Transitioning to renewable energy sources significantly reduces emissions from cement production.",
		"No": "Incorrect. Switching to renewable energy is crucial for minimizing the environmental impact of cement manufacturing."
	  }
	},
	{
	  "text": "Recently, France has introduced subsidies for research in eco-friendly cement alternatives. Should companies invest more in developing low-carbon cement?",
	  "effects": {
		"Yes": { "GDP": 0.2, "R&D": 1.5, "Emissions": -1.0 },
		"No": { "GDP": -0.4, "R&D": -1.3, "Emissions": 1.4 }
	  },
	  "output": {
		"Yes": "Correct! Investing in low-carbon cement drives innovation and reduces overall emissions.",
		"No": "Incorrect. Failing to invest in eco-friendly alternatives hampers progress towards a sustainable cement industry."
	  }
	},
	{
	  "text": "In the last few days, environmental groups have pressured the government to enforce stricter emission standards for cement factories. Should France implement these stricter standards?",
	  "effects": {
		"Yes": { "GDP": -0.2, "R&D": 1.0, "Emissions": -1.5 },
		"No": { "GDP": 0.5, "R&D": -0.8, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Correct! Stricter emission standards are vital for reducing the environmental impact of cement production.",
		"No": "Incorrect. Without stricter standards, cement factories may continue to contribute significantly to pollution."
	  }
	},
	{
	  "text": "This week, a new tax on carbon emissions from the cement industry was proposed. Should France implement this carbon tax?",
	  "effects": {
		"Yes": { "GDP": -0.4, "R&D": 1.3, "Emissions": -2.0 },
		"No": { "GDP": 0.6, "R&D": -1.1, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Correct! A carbon tax incentivizes cement producers to adopt greener practices and reduce emissions.",
		"No": "Incorrect. Implementing a carbon tax is essential for encouraging the cement industry to lower its carbon footprint."
	  }
	},
	{
	  "text": "In recent days, France has started a public awareness campaign about the environmental impact of cement production. Should consumers support products made with low-carbon cement?",
	  "effects": {
		"Yes": { "GDP": 0.1, "R&D": 0.5, "Emissions": -0.8 },
		"No": { "GDP": -0.2, "R&D": -0.6, "Emissions": 0.9 }
	  },
	  "output": {
		"Yes": "Correct! Consumer support for low-carbon cement drives demand for sustainable building materials.",
		"No": "Incorrect. Supporting low-carbon cement is crucial for promoting environmentally friendly construction practices."
	  }
	},
	{
	  "text": "Over the past few days, a new regulation requires all new buildings in France to use eco-friendly cement. Should construction companies comply with this regulation?",
	  "effects": {
		"Yes": { "GDP": -0.3, "R&D": 1.1, "Emissions": -1.4 },
		"No": { "GDP": 0.5, "R&D": -1.2, "Emissions": 1.6 }
	  },
	  "output": {
		"Yes": "Correct! Using eco-friendly cement in new buildings significantly reduces the sector's carbon emissions.",
		"No": "Incorrect. Compliance with eco-friendly regulations is essential for sustainable construction."
	  }
	},
	{
	  "text": "Recently, France has allocated funding for the development of recycled materials in cement production. Should the cement industry prioritize using recycled materials?",
	  "effects": {
		"Yes": { "GDP": 0.2, "R&D": 1.4, "Emissions": -1.3 },
		"No": { "GDP": -0.3, "R&D": -1.0, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Correct! Prioritizing recycled materials enhances sustainability and reduces the environmental footprint of cement.",
		"No": "Incorrect. Utilizing recycled materials is key to advancing a greener cement industry."
	  }
	},
	{
	  "text": "In the last few days, a proposal was made to ban the export of high-carbon cement from France. Should France implement this export ban?",
	  "effects": {
		"Yes": { "GDP": -0.5, "R&D": 1.0, "Emissions": -1.7 },
		"No": { "GDP": 0.7, "R&D": -0.9, "Emissions": 1.9 }
	  },
	  "output": {
		"Yes": "Correct! Banning high-carbon cement exports promotes the use of sustainable materials domestically.",
		"No": "Incorrect. An export ban on high-carbon cement is necessary to reduce overall emissions."
	  }
	},
	{
	  "text": "This week, France introduced incentives for companies that achieve carbon-neutral cement production. Should cement manufacturers strive for carbon neutrality?",
	  "effects": {
		"Yes": { "GDP": -0.1, "R&D": 1.5, "Emissions": -2.0 },
		"No": { "GDP": 0.4, "R&D": -1.4, "Emissions": 2.1 }
	  },
	  "output": {
		"Yes": "Correct! Striving for carbon neutrality drives innovation and significantly lowers emissions.",
		"No": "Incorrect. Achieving carbon neutrality is crucial for the sustainable future of the cement industry."
	  }
	},
	{
	  "text": "Recently, a new certification was introduced for low-emission cement products in France. Should consumers prefer certified low-emission cement when building?",
	  "effects": {
		"Yes": { "GDP": 0.1, "R&D": 0.7, "Emissions": -0.9 },
		"No": { "GDP": -0.2, "R&D": -0.5, "Emissions": 1.0 }
	  },
	  "output": {
		"Yes": "Correct! Choosing certified low-emission cement supports environmentally responsible building practices.",
		"No": "Incorrect. Preferring low-emission certified cement is essential for reducing construction-related emissions."
	  }
	},
	{
	  "text": "In the past week, France has increased taxes on traditional cement production methods. Should cement companies adopt alternative production methods to reduce their tax burden?",
	  "effects": {
		"Yes": { "GDP": -0.4, "R&D": 1.3, "Emissions": -1.6 },
		"No": { "GDP": 0.6, "R&D": -1.2, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Correct! Adopting alternative methods helps companies lower emissions and avoid higher taxes.",
		"No": "Incorrect. Shifting to alternative production methods is necessary to reduce both emissions and tax liabilities."
	  }
	},
	{
	  "text": "Recently, France has mandated annual reporting of carbon emissions for all cement manufacturers. Should companies enhance their transparency regarding emissions?",
	  "effects": {
		"Yes": { "GDP": -0.1, "R&D": 0.9, "Emissions": -1.1 },
		"No": { "GDP": 0.3, "R&D": -0.8, "Emissions": 1.3 }
	  },
	  "output": {
		"Yes": "Correct! Enhanced transparency fosters accountability and drives emission reductions in the cement industry.",
		"No": "Incorrect. Transparency in emissions reporting is crucial for monitoring and reducing the industry's environmental impact."
	  }
	},
	{
	  "text": "Over the past few days, a coalition of French municipalities has pushed for greener cement standards in local construction projects. Should local governments enforce these greener standards?",
	  "effects": {
		"Yes": { "GDP": -0.2, "R&D": 1.0, "Emissions": -1.4 },
		"No": { "GDP": 0.4, "R&D": -1.0, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Correct! Enforcing greener standards at the local level significantly contributes to national emission reduction goals.",
		"No": "Incorrect. Local enforcement of greener standards is essential for achieving broader environmental objectives."
	  }
	},
	{
	  "text": "This week, France has started a pilot program for carbon-neutral cement in public infrastructure projects. Should public agencies use carbon-neutral cement in their projects?",
	  "effects": {
		"Yes": { "GDP": -0.3, "R&D": 1.2, "Emissions": -1.7 },
		"No": { "GDP": 0.5, "R&D": -1.1, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Correct! Using carbon-neutral cement in public projects sets a standard for sustainability and reduces emissions.",
		"No": "Incorrect. Adopting carbon-neutral cement in public infrastructure is vital for environmental stewardship."
	  }
	},
	{
	  "text": "Recently, an environmental report highlighted the significant emissions from the French cement industry. Should the government implement stricter penalties for non-compliance with emission targets?",
	  "effects": {
		"Yes": { "GDP": -0.4, "R&D": 1.4, "Emissions": -1.9 },
		"No": { "GDP": 0.7, "R&D": -1.3, "Emissions": 2.0 }
	  },
	  "output": {
		"Yes": "Correct! Stricter penalties enforce compliance and encourage the cement industry to reduce emissions.",
		"No": "Incorrect. Implementing penalties is necessary to ensure the industry meets emission reduction targets."
	  }
	},
	{
	  "text": "In the past few days, France has introduced a grant program for startups developing green cement technologies. Should investors fund these green cement startups?",
	  "effects": {
		"Yes": { "GDP": 0.3, "R&D": 1.6, "Emissions": -1.5 },
		"No": { "GDP": -0.3, "R&D": -1.2, "Emissions": 1.7 }
	  },
	  "output": {
		"Yes": "Correct! Funding green cement startups accelerates the development of sustainable technologies and reduces emissions.",
		"No": "Incorrect. Investing in green cement startups is crucial for fostering innovation and environmental sustainability."
	  }
	},
	{
	  "text": "Recently, a new recycling mandate for concrete waste was proposed in France. Should cement producers adopt these recycling practices?",
	  "effects": {
		"Yes": { "GDP": 0.0, "R&D": 1.0, "Emissions": -1.3 },
		"No": { "GDP": 0.2, "R&D": -0.9, "Emissions": 1.4 }
	  },
	  "output": {
		"Yes": "Correct! Recycling concrete waste promotes sustainability and reduces the cement industry's carbon footprint.",
		"No": "Incorrect. Adopting recycling practices is essential for minimizing environmental impact."
	  }
	},
	{
	  "text": "Over the past week, France has held workshops on sustainable building materials, emphasizing low-carbon cement. Should builders prioritize these materials in their projects?",
	  "effects": {
		"Yes": { "GDP": 0.1, "R&D": 0.8, "Emissions": -1.0 },
		"No": { "GDP": -0.1, "R&D": -0.7, "Emissions": 1.1 }
	  },
	  "output": {
		"Yes": "Correct! Prioritizing low-carbon cement in building projects supports environmental sustainability.",
		"No": "Incorrect. Using sustainable materials like low-carbon cement is crucial for reducing construction emissions."
	  }
	},
	{
	  "text": "This week, a new research center for green cement technologies was established in France. Should the cement industry collaborate with this center?",
	  "effects": {
		"Yes": { "GDP": -0.2, "R&D": 1.5, "Emissions": -1.6 },
		"No": { "GDP": 0.3, "R&D": -1.4, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Correct! Collaboration with research centers accelerates the development of sustainable cement technologies.",
		"No": "Incorrect. Partnering with research institutions is vital for advancing green cement innovations."
	  }
	},
	{
	  "text": "Recently, France has implemented energy efficiency standards for cement kilns. Should cement plants upgrade their kilns to meet these standards?",
	  "effects": {
		"Yes": { "GDP": -0.3, "R&D": 1.1, "Emissions": -1.5 },
		"No": { "GDP": 0.4, "R&D": -1.0, "Emissions": 1.6 }
	  },
	  "output": {
		"Yes": "Correct! Upgrading kilns enhances energy efficiency and reduces emissions from cement production.",
		"No": "Incorrect. Meeting energy efficiency standards is essential for minimizing the environmental impact of cement kilns."
	  }
	},
	{
	  "text": "In the last few days, a proposal was made to integrate bio-based materials into cement mixtures. Should the French cement industry adopt bio-based additives?",
	  "effects": {
		"Yes": { "GDP": 0.2, "R&D": 1.3, "Emissions": -1.2 },
		"No": { "GDP": -0.2, "R&D": -1.1, "Emissions": 1.3 }
	  },
	  "output": {
		"Yes": "Correct! Using bio-based additives in cement enhances sustainability and reduces carbon emissions.",
		"No": "Incorrect. Adopting bio-based materials is crucial for developing eco-friendly cement products."
	  }
	},
	{
	  "text": "Recently, France has set a target to reduce cement industry emissions by 30% over the next decade. Should the industry take immediate actions to meet this target?",
	  "effects": {
		"Yes": { "GDP": -0.5, "R&D": 1.4, "Emissions": -2.0 },
		"No": { "GDP": 0.8, "R&D": -1.5, "Emissions": 2.2 }
	  },
	  "output": {
		"Yes": "Correct! Immediate actions are necessary to achieve significant emission reductions in the cement industry.",
		"No": "Incorrect. Delaying actions hampers the ability to meet important emission reduction targets."
	  }
	},
	{
	  "text": "This week, a new partnership was formed between French cement producers and environmental organizations. Should the industry engage in such partnerships to enhance sustainability?",
	  "effects": {
		"Yes": { "GDP": 0.0, "R&D": 1.2, "Emissions": -1.4 },
		"No": { "GDP": 0.1, "R&D": -1.0, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Correct! Collaborating with environmental organizations fosters sustainable practices and reduces emissions.",
		"No": "Incorrect. Engaging in partnerships is essential for advancing the industry's sustainability goals."
	  }
	},
	{
	  "text": "Over the past few days, France has introduced a labeling system for low-carbon cement products. Should manufacturers obtain this label to market their products?",
	  "effects": {
		"Yes": { "GDP": 0.1, "R&D": 0.9, "Emissions": -1.1 },
		"No": { "GDP": -0.1, "R&D": -0.8, "Emissions": 1.2 }
	  },
	  "output": {
		"Yes": "Correct! Obtaining the low-carbon label enhances product credibility and promotes sustainable choices.",
		"No": "Incorrect. The labeling system is important for identifying and marketing eco-friendly cement products."
	  }
	},
	{
	  "text": "Recently, an incentive program was launched for retrofitting existing cement plants with green technologies in France. Should plant owners take advantage of these incentives?",
	  "effects": {
		"Yes": { "GDP": -0.3, "R&D": 1.3, "Emissions": -1.7 },
		"No": { "GDP": 0.5, "R&D": -1.2, "Emissions": 1.8 }
	  },
	  "output": {
		"Yes": "Correct! Retrofitting plants with green technologies reduces emissions and benefits from financial incentives.",
		"No": "Incorrect. Taking advantage of incentives is crucial for upgrading facilities and minimizing environmental impact."
	  }
	},
	{
	  "text": "This week, France has mandated the use of supplementary cementitious materials (SCMs) in all new cement products. Should manufacturers comply with this mandate?",
	  "effects": {
		"Yes": { "GDP": -0.2, "R&D": 1.1, "Emissions": -1.3 },
		"No": { "GDP": 0.3, "R&D": -1.0, "Emissions": 1.4 }
	  },
	  "output": {
		"Yes": "Correct! Using SCMs enhances cement sustainability and reduces overall emissions.",
		"No": "Incorrect. Complying with the mandate is essential for producing environmentally friendly cement."
	  }
	},
	{
	  "text": "Recently, a national competition was launched to innovate low-emission cement solutions in France. Should companies participate in this competition?",
	  "effects": {
		"Yes": { "GDP": 0.2, "R&D": 1.5, "Emissions": -1.8 },
		"No": { "GDP": -0.2, "R&D": -1.3, "Emissions": 1.9 }
	  },
	  "output": {
		"Yes": "Correct! Participating in innovation competitions drives the development of sustainable cement technologies.",
		"No": "Incorrect. Engaging in such competitions is vital for fostering innovation and reducing emissions."
	  }
	},
	{
	  "text": "Over the past few days, France has introduced a requirement for lifecycle assessments of cement products. Should manufacturers conduct these assessments regularly?",
	  "effects": {
		"Yes": { "GDP": -0.1, "R&D": 0.8, "Emissions": -1.0 },
		"No": { "GDP": 0.2, "R&D": -0.7, "Emissions": 1.1 }
	  },
	  "output": {
		"Yes": "Correct! Conducting lifecycle assessments helps identify and mitigate the environmental impact of cement products.",
		"No": "Incorrect. Regular assessments are crucial for ensuring the sustainability of cement manufacturing."
	  }
	},
	{
	  "text": "This week, France has started offering tax breaks to companies that produce eco-friendly cement. Should cement producers utilize these tax breaks?",
	  "effects": {
		"Yes": { "GDP": 0.3, "R&D": 1.4, "Emissions": -1.5 },
		"No": { "GDP": -0.3, "R&D": -1.2, "Emissions": 1.6 }
	  },
	  "output": {
		"Yes": "Correct! Utilizing tax breaks encourages the production of eco-friendly cement and reduces emissions.",
		"No": "Incorrect. Taking advantage of tax incentives is essential for promoting sustainable cement practices."
	  }
	},
	{
	  "text": "Recently, France has mandated that all public construction projects use at least 20% recycled materials in cement. Should construction firms adhere to this mandate?",
	  "effects": {
		"Yes": { "GDP": -0.2, "R&D": 1.0, "Emissions": -1.4 },
		"No": { "GDP": 0.4, "R&D": -1.0, "Emissions": 1.5 }
	  },
	  "output": {
		"Yes": "Correct! Incorporating recycled materials significantly lowers the environmental impact of construction projects.",
		"No": "Incorrect. Adhering to the mandate is crucial for advancing sustainable construction practices."
	  }
	},
	{
	  "text": "Over the past week, a new research grant was announced for developing energy-efficient cement production methods in France. Should cement manufacturers apply for this grant?",
	  "effects": {
		"Yes": { "GDP": -0.3, "R&D": 1.6, "Emissions": -1.9 },
		"No": { "GDP": 0.6, "R&D": -1.5, "Emissions": 2.0 }
	  },
	  "output": {
		"Yes": "Correct! Securing research grants accelerates the development of energy-efficient and sustainable cement technologies.",
		"No": "Incorrect. Applying for research grants is essential for innovating and reducing emissions in cement production."
	  }
	}
  ],

"Metal" : [
	{
		"text": "Over the past week, the French metal industry has seen increased investments in sustainable practices. Do you support the implementation of stricter environmental regulations for metal manufacturing?",
		"effects": {
			"Yes": { "GDP": -1.5, "R&D": 2.0, "Emissions": -1.8 },
			"No": { "GDP": 1.2, "R&D": -1.0, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Great choice! Stricter regulations will lead to a more sustainable metal industry, reducing emissions and fostering innovation.",
			"No": "Opting out may boost short-term economic gains, but could result in higher emissions and hinder long-term sustainability."
		}
	},
	{
		"text": "In recent days, there has been a surge in demand for recycled metals in France. Should the government provide subsidies to companies that utilize recycled materials?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.5, "Emissions": -1.2 },
			"No": { "GDP": -0.8, "R&D": -1.3, "Emissions": 1.0 }
		},
		"output": {
			"Yes": "Excellent! Subsidies will encourage the use of recycled materials, boosting the economy and reducing environmental impact.",
			"No": "Without subsidies, companies might be less inclined to use recycled materials, potentially increasing emissions and stalling economic growth."
		}
	},
	{
		"text": "Recently, advancements in metal recycling technologies have emerged in France. Should the government invest in research and development for these technologies?",
		"effects": {
			"Yes": { "GDP": 0.5, "R&D": 2.0, "Emissions": -1.0 },
			"No": { "GDP": -1.0, "R&D": -2.0, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Investing in R&D will drive innovation in metal recycling, enhancing economic growth and lowering emissions.",
			"No": "Neglecting R&D could slow technological progress, negatively impacting the economy and increasing environmental harm."
		}
	},
	{
		"text": "Over the past few days, concerns about metal industry emissions have grown. Should France implement a carbon tax specifically targeting metal manufacturers?",
		"effects": {
			"Yes": { "GDP": -1.8, "R&D": 1.0, "Emissions": -2.0 },
			"No": { "GDP": 1.5, "R&D": -0.5, "Emissions": 1.8 }
		},
		"output": {
			"Yes": "Implementing a carbon tax will significantly reduce emissions, promoting cleaner practices in the metal industry.",
			"No": "Avoiding a carbon tax may lead to higher emissions and missed opportunities for sustainable economic development."
		}
	},
	{
		"text": "Lately, there has been a push for eco-friendly certifications in the French metal sector. Should the government mandate such certifications for all metal products?",
		"effects": {
			"Yes": { "GDP": -0.5, "R&D": 1.2, "Emissions": -1.5 },
			"No": { "GDP": 0.8, "R&D": -1.5, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Mandating eco-friendly certifications will enhance the industry's sustainability and attract environmentally conscious consumers.",
			"No": "Without certifications, it may be challenging to ensure sustainable practices, potentially increasing environmental impacts."
		}
	},
	{
		"text": "In recent weeks, the availability of green energy sources for metal production has improved in France. Should metal companies transition to 100% renewable energy?",
		"effects": {
			"Yes": { "GDP": -1.0, "R&D": 1.8, "Emissions": -2.0 },
			"No": { "GDP": 1.3, "R&D": -1.2, "Emissions": 1.7 }
		},
		"output": {
			"Yes": "Transitioning to renewable energy will drastically cut emissions and promote sustainable growth in the metal industry.",
			"No": "Continuing with traditional energy sources may boost short-term profits but will lead to higher emissions and long-term environmental issues."
		}
	},
	{
		"text": "Recently, France has seen technological breakthroughs in low-emission metal production. Should the government provide tax incentives to companies adopting these technologies?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 2.0, "Emissions": -1.5 },
			"No": { "GDP": -1.4, "R&D": -1.8, "Emissions": 1.6 }
		},
		"output": {
			"Yes": "Tax incentives will encourage companies to adopt low-emission technologies, fostering innovation and reducing environmental impact.",
			"No": "Without incentives, the adoption of cleaner technologies may be slow, leading to continued high emissions and missed economic opportunities."
		}
	},
	{
		"text": "Over the last few days, public awareness about metal industry pollution has increased in France. Should the government increase funding for public awareness campaigns on this issue?",
		"effects": {
			"Yes": { "GDP": -0.7, "R&D": 1.0, "Emissions": -1.0 },
			"No": { "GDP": 0.6, "R&D": -1.0, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Increasing funding for awareness campaigns will educate the public, driving demand for sustainable metal products and reducing emissions.",
			"No": "Without awareness campaigns, public pressure for sustainable practices may diminish, allowing emissions to remain high."
		}
	},
	{
		"text": "In recent times, the cost of metal production in France has fluctuated due to environmental regulations. Should the government stabilize these regulations to ensure consistent production costs?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": -0.5, "Emissions": 0.0 },
			"No": { "GDP": -1.0, "R&D": 0.5, "Emissions": 1.0 }
		},
		"output": {
			"Yes": "Stabilizing regulations can provide certainty for metal producers, fostering investment and steady economic growth.",
			"No": "Changing regulations may introduce uncertainty, potentially disrupting production and leading to increased emissions."
		}
	},
	{
		"text": "Recently, collaborations between metal companies and environmental organizations have increased in France. Should the government incentivize such partnerships?",
		"effects": {
			"Yes": { "GDP": 0.8, "R&D": 1.5, "Emissions": -1.2 },
			"No": { "GDP": -0.9, "R&D": -1.3, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Incentivizing partnerships will enhance sustainable practices, drive innovation, and reduce the industry's carbon footprint.",
			"No": "Without incentives, collaborations may be limited, hindering progress towards a more sustainable metal industry."
		}
	},
	{
		"text": "Over the past few days, the lifecycle of metal products in France has come under scrutiny. Should the government implement mandatory recycling programs for all metal products?",
		"effects": {
			"Yes": { "GDP": -1.2, "R&D": 1.8, "Emissions": -1.7 },
			"No": { "GDP": 1.1, "R&D": -1.5, "Emissions": 1.6 }
		},
		"output": {
			"Yes": "Mandatory recycling programs will ensure sustainable use of resources, reduce emissions, and promote economic resilience.",
			"No": "Without recycling mandates, resource inefficiency may increase, leading to higher emissions and economic inefficiencies."
		}
	},
	{
		"text": "Recently, the export of French metal products has been influenced by global environmental standards. Should France prioritize meeting these international standards to enhance its metal exports?",
		"effects": {
			"Yes": { "GDP": 1.5, "R&D": 1.0, "Emissions": -1.5 },
			"No": { "GDP": -1.3, "R&D": -0.8, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Prioritizing international standards will boost exports, support economic growth, and ensure environmentally responsible production.",
			"No": "Neglecting international standards may limit export opportunities and lead to higher emissions, impacting global competitiveness."
		}
	},
	{
		"text": "In recent weeks, automation in the metal industry has advanced in France. Should the government support automation initiatives to improve efficiency and reduce emissions?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.7, "Emissions": -1.8 },
			"No": { "GDP": -1.0, "R&D": -1.5, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Supporting automation will enhance production efficiency, lower emissions, and drive economic growth in the metal sector.",
			"No": "Without automation support, the industry may lag in efficiency and emissions reductions, hindering economic progress."
		}
	},
	{
		"text": "Over the past few days, the French government has proposed a ban on single-use metal packaging. Do you agree with implementing this ban?",
		"effects": {
			"Yes": { "GDP": -0.6, "R&D": 1.3, "Emissions": -1.0 },
			"No": { "GDP": 0.7, "R&D": -1.2, "Emissions": 1.1 }
		},
		"output": {
			"Yes": "Banning single-use metal packaging will reduce waste and emissions, promoting a more sustainable metal industry.",
			"No": "Allowing single-use packaging may sustain current economic levels but could increase environmental pollution."
		}
	},
	{
		"text": "Recently, the cost of raw materials for metal production has fluctuated in France. Should the government implement price controls to stabilize these costs?",
		"effects": {
			"Yes": { "GDP": -0.9, "R&D": 0.5, "Emissions": 0.0 },
			"No": { "GDP": 1.0, "R&D": -0.5, "Emissions": 0.0 }
		},
		"output": {
			"Yes": "Price controls can provide stability for producers, fostering a predictable economic environment.",
			"No": "Allowing market fluctuations may encourage efficiency but could lead to economic uncertainty for metal producers."
		}
	},
	{
		"text": "In recent times, the integration of circular economy principles has gained traction in France's metal industry. Should the government mandate circular economy practices for all metal companies?",
		"effects": {
			"Yes": { "GDP": -1.4, "R&D": 2.0, "Emissions": -1.9 },
			"No": { "GDP": 1.4, "R&D": -1.9, "Emissions": 1.9 }
		},
		"output": {
			"Yes": "Mandating circular economy practices will ensure resource efficiency, drive innovation, and significantly reduce emissions.",
			"No": "Without such mandates, the industry may continue inefficient practices, leading to higher emissions and resource waste."
		}
	},
	{
		"text": "Over the last few days, France has seen an increase in public demand for transparent supply chains in the metal industry. Should the government require all metal companies to disclose their supply chain practices?",
		"effects": {
			"Yes": { "GDP": -0.8, "R&D": 1.2, "Emissions": -1.3 },
			"No": { "GDP": 0.9, "R&D": -1.1, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Requiring transparency will build consumer trust, encourage sustainable practices, and reduce environmental impacts.",
			"No": "Without transparency requirements, unethical practices may persist, potentially increasing emissions and damaging the industry's reputation."
		}
	},
	{
		"text": "Recently, advancements in biodegradable metal coatings have been developed in France. Should the government fund the commercialization of these coatings?",
		"effects": {
			"Yes": { "GDP": 0.7, "R&D": 2.0, "Emissions": -1.6 },
			"No": { "GDP": -0.7, "R&D": -2.0, "Emissions": 1.6 }
		},
		"output": {
			"Yes": "Funding biodegradable coatings will promote sustainable products, enhance innovation, and lower environmental impact.",
			"No": "Without funding, the commercialization of eco-friendly coatings may stall, leading to continued environmental challenges."
		}
	},
	{
		"text": "In the past week, the French metal industry has faced increased scrutiny over water usage. Should the government impose stricter water usage regulations on metal manufacturers?",
		"effects": {
			"Yes": { "GDP": -1.1, "R&D": 1.5, "Emissions": -0.8 },
			"No": { "GDP": 1.0, "R&D": -1.4, "Emissions": 0.8 }
		},
		"output": {
			"Yes": "Stricter water regulations will promote sustainable usage, benefiting the environment and encouraging innovative practices.",
			"No": "Without regulations, water resources may be overused, leading to environmental degradation and potential economic repercussions."
		}
	},
	{
		"text": "Recently, the adoption of electric vehicles has influenced the demand for certain metals in France. Should the government support the metal industry in transitioning to meet this new demand?",
		"effects": {
			"Yes": { "GDP": 1.3, "R&D": 2.0, "Emissions": -1.5 },
			"No": { "GDP": -1.3, "R&D": -2.0, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Supporting the transition will align the metal industry with emerging markets, fostering economic growth and reducing emissions.",
			"No": "Without support, the industry may struggle to adapt, potentially missing out on growth opportunities and maintaining higher emission levels."
		}
	},
	{
		"text": "Over the last few days, the French government has considered implementing a ban on non-recyclable metal products. Do you agree with this proposal?",
		"effects": {
			"Yes": { "GDP": -1.0, "R&D": 1.7, "Emissions": -1.4 },
			"No": { "GDP": 1.0, "R&D": -1.7, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Banning non-recyclable products will promote sustainability, reduce waste, and encourage innovation in the metal industry.",
			"No": "Allowing non-recyclable products may sustain current economic levels but could increase environmental pollution and waste."
		}
	},
	{
		"text": "Recently, France has witnessed the development of smart manufacturing techniques in the metal sector. Should the government incentivize the adoption of smart manufacturing?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 1.8, "Emissions": -1.7 },
			"No": { "GDP": -1.2, "R&D": -1.8, "Emissions": 1.7 }
		},
		"output": {
			"Yes": "Incentivizing smart manufacturing will enhance efficiency, drive innovation, and significantly reduce emissions in the metal industry.",
			"No": "Without incentives, the adoption of advanced manufacturing techniques may slow, hindering economic and environmental progress."
		}
	},
	{
		"text": "In the past week, the use of heavy metals in French manufacturing has raised environmental concerns. Should the government restrict the use of certain heavy metals?",
		"effects": {
			"Yes": { "GDP": -1.4, "R&D": 1.5, "Emissions": -1.9 },
			"No": { "GDP": 1.4, "R&D": -1.5, "Emissions": 1.9 }
		},
		"output": {
			"Yes": "Restricting heavy metals will mitigate environmental risks, promote safer manufacturing practices, and encourage sustainable innovation.",
			"No": "Allowing unrestricted use may maintain economic activity but could lead to severe environmental and health issues."
		}
	},
	{
		"text": "Recently, the French metal industry has been impacted by global trade tensions. Should the government implement protective tariffs to support local metal producers?",
		"effects": {
			"Yes": { "GDP": 0.9, "R&D": -0.7, "Emissions": 0.0 },
			"No": { "GDP": -0.9, "R&D": 0.7, "Emissions": 0.0 }
		},
		"output": {
			"Yes": "Implementing tariffs can protect local producers, ensuring economic stability within the metal industry.",
			"No": "Without tariffs, local producers may struggle against global competition, potentially harming the domestic economy."
		}
	},
	{
		"text": "Over the last few days, the lifecycle assessment of metal products in France has highlighted significant environmental impacts. Should the government require comprehensive lifecycle assessments for all metal products?",
		"effects": {
			"Yes": { "GDP": -0.8, "R&D": 1.6, "Emissions": -1.2 },
			"No": { "GDP": 0.8, "R&D": -1.6, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Requiring lifecycle assessments will ensure transparency, promote sustainable practices, and help reduce the environmental footprint of metal products.",
			"No": "Without such requirements, environmental impacts may remain unaddressed, leading to continued ecological harm."
		}
	},
	{
		"text": "Recently, advancements in additive manufacturing have been made in France's metal industry. Should the government promote the adoption of additive manufacturing technologies?",
		"effects": {
			"Yes": { "GDP": 1.1, "R&D": 2.0, "Emissions": -1.5 },
			"No": { "GDP": -1.1, "R&D": -2.0, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Promoting additive manufacturing will enhance production efficiency, foster innovation, and reduce emissions in the metal sector.",
			"No": "Without promotion, the adoption of advanced manufacturing techniques may lag, hindering economic and environmental progress."
		}
	},
	{
		"text": "In recent weeks, the French metal industry has faced challenges related to energy consumption. Should the government mandate energy efficiency standards for all metal manufacturing processes?",
		"effects": {
			"Yes": { "GDP": -1.3, "R&D": 1.4, "Emissions": -1.6 },
			"No": { "GDP": 1.3, "R&D": -1.4, "Emissions": 1.6 }
		},
		"output": {
			"Yes": "Mandating energy efficiency standards will reduce energy consumption, lower emissions, and encourage innovative solutions in the metal industry.",
			"No": "Without efficiency standards, energy use may remain high, leading to increased emissions and environmental strain."
		}
	},
	{
		"text": "Over the past few days, the integration of digital technologies in metal production has been a topic of discussion in France. Should the government invest in digital infrastructure for the metal industry?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.9, "Emissions": -1.4 },
			"No": { "GDP": -1.0, "R&D": -1.9, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Investing in digital infrastructure will modernize the metal industry, enhance efficiency, and contribute to emission reductions.",
			"No": "Without digital investments, the industry may fall behind technologically, potentially increasing emissions and reducing competitiveness."
		}
	},
	{
		"text": "Recently, the French government has considered providing grants for small metal manufacturers to adopt green technologies. Do you support this initiative?",
		"effects": {
			"Yes": { "GDP": 0.8, "R&D": 1.6, "Emissions": -1.3 },
			"No": { "GDP": -0.8, "R&D": -1.6, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Supporting small manufacturers with grants will promote widespread adoption of green technologies, enhancing sustainability and economic growth.",
			"No": "Without grants, small manufacturers may struggle to adopt green technologies, leading to continued high emissions and limited growth."
		}
	},
	{
		"text": "In the last week, the use of hazardous chemicals in metal processing has raised safety concerns in France. Should the government ban the use of these hazardous chemicals?",
		"effects": {
			"Yes": { "GDP": -1.5, "R&D": 1.8, "Emissions": -1.7 },
			"No": { "GDP": 1.5, "R&D": -1.8, "Emissions": 1.7 }
		},
		"output": {
			"Yes": "Banning hazardous chemicals will improve safety and environmental standards, fostering a healthier metal industry.",
			"No": "Allowing hazardous chemicals may sustain production levels but at the cost of environmental and public health."
		}
	},
	{
		"text": "Recently, there has been an increase in collaborative projects between French metal companies and universities. Should the government fund these collaborative initiatives to drive innovation?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 2.0, "Emissions": -1.5 },
			"No": { "GDP": -1.0, "R&D": -2.0, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Funding collaborations will spur innovation, enhance research capabilities, and contribute to emission reductions in the metal industry.",
			"No": "Without funding, collaborative projects may decline, limiting innovation and maintaining higher emission levels."
		}
	},
	{
		"text": "Over the past few days, the French metal industry has explored alternative raw materials to reduce environmental impact. Should the government support research into alternative materials?",
		"effects": {
			"Yes": { "GDP": 0.9, "R&D": 2.0, "Emissions": -1.6 },
			"No": { "GDP": -0.9, "R&D": -2.0, "Emissions": 1.6 }
		},
		"output": {
			"Yes": "Supporting research into alternative materials will lead to sustainable production methods and lower emissions.",
			"No": "Without support, the search for sustainable alternatives may slow, resulting in continued environmental challenges."
		}
	},
	{
		"text": "Recently, the adoption of blockchain technology has been proposed to enhance transparency in the French metal supply chain. Should the government mandate the use of blockchain for all metal transactions?",
		"effects": {
			"Yes": { "GDP": -0.7, "R&D": 1.5, "Emissions": -1.0 },
			"No": { "GDP": 0.7, "R&D": -1.5, "Emissions": 1.0 }
		},
		"output": {
			"Yes": "Mandating blockchain will increase supply chain transparency, fostering trust and promoting sustainable practices in the metal industry.",
			"No": "Without blockchain, supply chain transparency may be limited, potentially leading to unethical practices and higher emissions."
		}
	},
	{
		"text": "In recent times, the French metal industry has seen advancements in energy-efficient furnaces. Should the government subsidize the adoption of these furnaces?",
		"effects": {
			"Yes": { "GDP": 0.6, "R&D": 1.9, "Emissions": -1.8 },
			"No": { "GDP": -0.6, "R&D": -1.9, "Emissions": 1.8 }
		},
		"output": {
			"Yes": "Subsidizing energy-efficient furnaces will reduce energy consumption, lower emissions, and promote economic growth.",
			"No": "Without subsidies, the adoption of efficient furnaces may be slow, maintaining higher energy use and emissions."
		}
	},
	{
		"text": "Over the last week, the French government has proposed tax breaks for metal companies that achieve significant emission reductions. Do you support this proposal?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 1.7, "Emissions": -1.9 },
			"No": { "GDP": -1.2, "R&D": -1.7, "Emissions": 1.9 }
		},
		"output": {
			"Yes": "Supporting tax breaks will incentivize emission reductions, fostering a greener and more competitive metal industry.",
			"No": "Without incentives, companies may lack motivation to reduce emissions, leading to continued environmental impact."
		}
	},
	{
		"text": "Recently, there has been a debate on the role of artificial intelligence in optimizing metal production in France. Should the government invest in AI technologies for the metal sector?",
		"effects": {
			"Yes": { "GDP": 1.1, "R&D": 2.0, "Emissions": -1.5 },
			"No": { "GDP": -1.1, "R&D": -2.0, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Investing in AI will enhance production efficiency, drive innovation, and reduce emissions in the metal industry.",
			"No": "Without AI investments, the industry may miss out on efficiency gains and emission reductions, hindering progress."
		}
	}
],

"Nuclear" : [
	{
		"text": "Over the past week, the French government has proposed a new nuclear energy policy. Do you support the expansion of nuclear power plants in France?",
		"effects": {
			"Yes": { "GDP": 1.5, "R&D": 0.8, "Emissions": -1.2 },
			"No": { "GDP": -1.0, "R&D": -0.5, "Emissions": 1.0 }
		},
		"output": {
			"Yes": "Great choice! Expanding nuclear energy can boost the economy and reduce carbon emissions.",
			"No": "Understood. However, declining nuclear expansion may slow economic growth and increase emissions."
		}
	},
	{
		"text": "Recently, a major French city hosted a climate summit focusing on sustainable energy. Should France invest more in nuclear research and development?",
		"effects": {
			"Yes": { "GDP": 0.5, "R&D": 1.8, "Emissions": -0.7 },
			"No": { "GDP": -0.7, "R&D": -1.5, "Emissions": 0.5 }
		},
		"output": {
			"Yes": "Investing in nuclear R&D is a smart move to innovate and maintain energy leadership.",
			"No": "Choosing not to invest may hinder technological advancements and energy efficiency."
		}
	},
	{
		"text": "In the last few days, environmental groups have raised concerns about nuclear waste management in France. Should the government increase regulations on nuclear facilities?",
		"effects": {
			"Yes": { "GDP": -0.8, "R&D": 0.3, "Emissions": -0.5 },
			"No": { "GDP": 0.6, "R&D": -0.2, "Emissions": 0.4 }
		},
		"output": {
			"Yes": "Enhancing regulations ensures safety and sustainability, even if it slightly impacts the economy.",
			"No": "Relaxing regulations can boost economic activities but may raise environmental concerns."
		}
	},
	{
		"text": "This month, France achieved a milestone in reducing carbon emissions through nuclear energy. Should nuclear power remain a key component of France's energy strategy?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.2, "Emissions": -2.0 },
			"No": { "GDP": -1.5, "R&D": -1.0, "Emissions": 1.8 }
		},
		"output": {
			"Yes": "Maintaining nuclear power supports economic growth and significantly lowers emissions.",
			"No": "Removing nuclear from the strategy might hinder economic progress and increase emissions."
		}
	},
	{
		"text": "Recently, a technological breakthrough in nuclear fusion was announced in France. Should the government fund this new fusion research initiative?",
		"effects": {
			"Yes": { "GDP": 0.7, "R&D": 2.0, "Emissions": -1.0 },
			"No": { "GDP": -0.5, "R&D": -1.8, "Emissions": 0.9 }
		},
		"output": {
			"Yes": "Funding fusion research can position France as a leader in cutting-edge energy solutions.",
			"No": "Declining to fund may miss out on revolutionary energy advancements and economic benefits."
		}
	},
	{
		"text": "In the past few days, energy prices have fluctuated due to changes in nuclear energy output. Should France implement subsidies for nuclear energy to stabilize the market?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 0.5, "Emissions": -0.8 },
			"No": { "GDP": -1.3, "R&D": -0.4, "Emissions": 0.6 }
		},
		"output": {
			"Yes": "Subsidies can stabilize energy prices and support the nuclear sector's growth.",
			"No": "Without subsidies, the nuclear industry might face economic challenges and market instability."
		}
	},
	{
		"text": "A recent survey in France shows public opinion is divided on nuclear energy. Should the government initiate a public awareness campaign to educate citizens about nuclear power?",
		"effects": {
			"Yes": { "GDP": 0.3, "R&D": 0.2, "Emissions": -0.3 },
			"No": { "GDP": -0.2, "R&D": -0.1, "Emissions": 0.2 }
		},
		"output": {
			"Yes": "Educating the public can build support and understanding for nuclear initiatives.",
			"No": "Skipping awareness efforts might lead to continued public uncertainty and resistance."
		}
	},
	{
		"text": "Over the last week, France has experienced a shortage of skilled workers in the nuclear sector. Should the government offer incentives to attract more professionals to this field?",
		"effects": {
			"Yes": { "GDP": 1.4, "R&D": 0.6, "Emissions": -0.5 },
			"No": { "GDP": -1.1, "R&D": -0.7, "Emissions": 0.4 }
		},
		"output": {
			"Yes": "Attracting skilled workers strengthens the nuclear industry and supports economic growth.",
			"No": "Without incentives, the sector may struggle to innovate and maintain efficiency."
		}
	},
	{
		"text": "Recently, a new nuclear reactor design has been proposed in France. Should the government approve the construction of this advanced reactor?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.5, "Emissions": -1.8 },
			"No": { "GDP": -0.9, "R&D": -1.3, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "Approving the reactor can drive technological progress and reduce environmental impact.",
			"No": "Rejecting the design may limit advancements and keep emission levels higher."
		}
	},
	{
		"text": "In the past few days, international agreements on climate change have emphasized the role of nuclear energy. Should France align its policies accordingly?",
		"effects": {
			"Yes": { "GDP": 0.8, "R&D": 1.0, "Emissions": -1.0 },
			"No": { "GDP": -0.6, "R&D": -0.9, "Emissions": 0.8 }
		},
		"output": {
			"Yes": "Aligning with international agreements can enhance France's global standing and environmental efforts.",
			"No": "Diverging from agreements might affect international relations and climate goals."
		}
	},
	{
		"text": "Recently, there has been a significant investment in renewable energy in France. Should the government prioritize nuclear energy over renewables to balance the energy mix?",
		"effects": {
			"Yes": { "GDP": 1.3, "R&D": 0.9, "Emissions": -1.5 },
			"No": { "GDP": -1.2, "R&D": -0.8, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Prioritizing nuclear can ensure a stable and low-emission energy supply alongside renewables.",
			"No": "Focusing solely on renewables may lead to energy instability and higher emissions."
		}
	},
	{
		"text": "A recent incident highlighted safety concerns in France's nuclear plants. Should the government implement stricter safety protocols immediately?",
		"effects": {
			"Yes": { "GDP": -0.7, "R&D": 0.4, "Emissions": -0.6 },
			"No": { "GDP": 0.5, "R&D": -0.3, "Emissions": 0.5 }
		},
		"output": {
			"Yes": "Enhancing safety ensures long-term sustainability, despite short-term economic impacts.",
			"No": "Maintaining current protocols can benefit the economy but may compromise safety."
		}
	},
	{
		"text": "Over the past few days, advancements in nuclear waste recycling have been announced in France. Should the government fund these recycling projects?",
		"effects": {
			"Yes": { "GDP": 0.9, "R&D": 1.7, "Emissions": -0.9 },
			"No": { "GDP": -0.8, "R&D": -1.6, "Emissions": 0.7 }
		},
		"output": {
			"Yes": "Funding recycling projects promotes sustainability and technological innovation.",
			"No": "Without funding, progress in waste management and environmental protection may stall."
		}
	},
	{
		"text": "Recently, France has seen a decline in nuclear energy exports. Should the government introduce incentives to boost nuclear technology exports?",
		"effects": {
			"Yes": { "GDP": 1.6, "R&D": 0.7, "Emissions": -0.4 },
			"No": { "GDP": -1.4, "R&D": -0.6, "Emissions": 0.3 }
		},
		"output": {
			"Yes": "Boosting exports can enhance economic growth and establish France as a nuclear leader.",
			"No": "Reducing export efforts may limit economic benefits and global influence."
		}
	},
	{
		"text": "In the last week, debates have intensified about the role of nuclear energy in France's future. Should nuclear power be phased out in favor of other energy sources?",
		"effects": {
			"Yes": { "GDP": -2.0, "R&D": -1.5, "Emissions": 1.9 },
			"No": { "GDP": 1.8, "R&D": 1.4, "Emissions": -1.7 }
		},
		"output": {
			"Yes": "Phasing out nuclear may reduce emissions but could negatively impact the economy and innovation.",
			"No": "Continuing nuclear power supports economic stability and emission reductions."
		}
	},
	{
		"text": "Recently, a new regulation mandates the use of advanced safety systems in all nuclear reactors in France. Should the government provide subsidies to cover these implementation costs?",
		"effects": {
			"Yes": { "GDP": -0.5, "R&D": 0.6, "Emissions": -0.3 },
			"No": { "GDP": 0.4, "R&D": -0.5, "Emissions": 0.2 }
		},
		"output": {
			"Yes": "Subsidies can ease the financial burden, ensuring compliance and safety improvements.",
			"No": "Without subsidies, the industry may struggle with costs, potentially delaying safety enhancements."
		}
	},
	{
		"text": "Over the past few days, France has hosted international nuclear energy conferences. Should the country increase its participation in global nuclear initiatives?",
		"effects": {
			"Yes": { "GDP": 0.7, "R&D": 1.3, "Emissions": -0.8 },
			"No": { "GDP": -0.6, "R&D": -1.2, "Emissions": 0.7 }
		},
		"output": {
			"Yes": "Active participation fosters collaboration and innovation in the nuclear sector.",
			"No": "Limited involvement may result in missed opportunities for advancements and partnerships."
		}
	},
	{
		"text": "Recently, a French energy company announced plans to decommission several older nuclear reactors. Should the government support the decommissioning process financially?",
		"effects": {
			"Yes": { "GDP": -1.3, "R&D": 0.2, "Emissions": 1.0 },
			"No": { "GDP": 1.1, "R&D": -0.3, "Emissions": -0.9 }
		},
		"output": {
			"Yes": "Supporting decommissioning ensures safe closure and environmental protection.",
			"No": "Without support, the process may become costlier and pose environmental risks."
		}
	},
	{
		"text": "In the last week, technological advancements have made nuclear energy safer and more efficient in France. Should the government accelerate the adoption of these new technologies?",
		"effects": {
			"Yes": { "GDP": 1.7, "R&D": 1.9, "Emissions": -1.5 },
			"No": { "GDP": -1.6, "R&D": -1.8, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Accelerating adoption drives economic growth and enhances environmental sustainability.",
			"No": "Delaying implementation may slow progress and miss opportunities for emission reductions."
		}
	},
	{
		"text": "Recently, France has faced increased competition in the nuclear technology market. Should the government implement protectionist policies to support domestic nuclear industries?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 0.5, "Emissions": -0.6 },
			"No": { "GDP": -1.0, "R&D": -0.4, "Emissions": 0.5 }
		},
		"output": {
			"Yes": "Protectionist policies can strengthen domestic industries and maintain market share.",
			"No": "Opening markets may enhance competition but could challenge local industries."
		}
	},
	{
		"text": "Over the past few days, France has seen a surge in public-private partnerships in the nuclear sector. Should the government encourage more collaborations between the public sector and private companies?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 1.2, "Emissions": -0.7 },
			"No": { "GDP": -0.8, "R&D": -1.0, "Emissions": 0.6 }
		},
		"output": {
			"Yes": "Encouraging partnerships can drive innovation and economic growth in the nuclear field.",
			"No": "Limiting collaborations may slow progress and reduce competitive advantages."
		}
	},
	{
		"text": "Recently, advancements in small modular reactors (SMRs) have been made in France. Should the government prioritize funding for SMR development?",
		"effects": {
			"Yes": { "GDP": 1.5, "R&D": 1.8, "Emissions": -1.3 },
			"No": { "GDP": -1.4, "R&D": -1.7, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Prioritizing SMRs can lead to safer, more flexible nuclear solutions and economic benefits.",
			"No": "Not focusing on SMRs may limit innovation and maintain higher emission levels."
		}
	},
	{
		"text": "In the past week, France has experienced a technological setback in nuclear energy efficiency. Should the government increase investment to overcome these challenges?",
		"effects": {
			"Yes": { "GDP": 0.9, "R&D": 1.4, "Emissions": -0.9 },
			"No": { "GDP": -0.7, "R&D": -1.3, "Emissions": 0.8 }
		},
		"output": {
			"Yes": "Increasing investment can address efficiency issues and promote sustainable energy.",
			"No": "Without additional investment, challenges may persist, affecting overall performance."
		}
	},
	{
		"text": "Recently, there has been a proposal to integrate nuclear energy with renewable sources in France's energy grid. Should the government support this integrated approach?",
		"effects": {
			"Yes": { "GDP": 1.3, "R&D": 1.5, "Emissions": -1.6 },
			"No": { "GDP": -1.2, "R&D": -1.4, "Emissions": 1.5 }
		},
		"output": {
			"Yes": "An integrated approach enhances energy stability and reduces environmental impact.",
			"No": "Separating energy sources may lead to inefficiencies and higher emissions."
		}
	},
	{
		"text": "Over the past few days, France has allocated a significant budget towards nuclear safety research. Should the government continue to prioritize nuclear safety funding?",
		"effects": {
			"Yes": { "GDP": -0.4, "R&D": 1.6, "Emissions": -0.5 },
			"No": { "GDP": 0.3, "R&D": -1.5, "Emissions": 0.4 }
		},
		"output": {
			"Yes": "Prioritizing safety ensures long-term sustainability and public trust in nuclear energy.",
			"No": "Reducing safety funding may compromise reactor integrity and environmental safety."
		}
	},
	{
		"text": "Recently, France has entered into a bilateral agreement to share nuclear technology with neighboring countries. Should the government pursue more international nuclear collaborations?",
		"effects": {
			"Yes": { "GDP": 1.1, "R&D": 1.3, "Emissions": -1.0 },
			"No": { "GDP": -1.0, "R&D": -1.2, "Emissions": 0.9 }
		},
		"output": {
			"Yes": "International collaborations can boost technological advancements and economic growth.",
			"No": "Avoiding collaborations may limit innovation and reduce global competitiveness."
		}
	},
	{
		"text": "In the last week, debates have arisen about the economic viability of maintaining France's current nuclear infrastructure. Should the government invest in upgrading existing reactors?",
		"effects": {
			"Yes": { "GDP": 1.4, "R&D": 0.9, "Emissions": -1.2 },
			"No": { "GDP": -1.3, "R&D": -0.8, "Emissions": 1.1 }
		},
		"output": {
			"Yes": "Upgrading reactors can enhance efficiency and extend their operational life, benefiting the economy.",
			"No": "Neglecting upgrades may lead to inefficiencies and increased emission levels."
		}
	},
	{
		"text": "Recently, France has seen a rise in nuclear energy exports. Should the government implement policies to further encourage the export of nuclear technology?",
		"effects": {
			"Yes": { "GDP": 1.6, "R&D": 0.7, "Emissions": -0.5 },
			"No": { "GDP": -1.5, "R&D": -0.6, "Emissions": 0.4 }
		},
		"output": {
			"Yes": "Encouraging exports can drive economic growth and establish France as a nuclear powerhouse.",
			"No": "Limiting export efforts may reduce economic opportunities and global influence."
		}
	},
	{
		"text": "Over the past few days, advancements in nuclear safety technologies have been achieved in France. Should the government accelerate the implementation of these technologies across all nuclear plants?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 1.5, "Emissions": -1.4 },
			"No": { "GDP": -1.1, "R&D": -1.4, "Emissions": 1.3 }
		},
		"output": {
			"Yes": "Accelerating implementation enhances safety and supports sustainable energy production.",
			"No": "Delaying adoption may compromise safety and hinder emission reduction efforts."
		}
	},
	{
		"text": "Recently, a report highlighted the economic benefits of nuclear energy for France. Should the government use this report to justify further investments in the nuclear sector?",
		"effects": {
			"Yes": { "GDP": 1.5, "R&D": 1.0, "Emissions": -1.1 },
			"No": { "GDP": -1.4, "R&D": -0.9, "Emissions": 1.0 }
		},
		"output": {
			"Yes": "Using the report supports informed decision-making and promotes nuclear investments.",
			"No": "Ignoring the report may overlook economic advantages and delay necessary investments."
		}
	},
	{
		"text": "In the last week, France has faced increased public scrutiny over nuclear energy costs. Should the government subsidize nuclear energy to make it more affordable for consumers?",
		"effects": {
			"Yes": { "GDP": 1.0, "R&D": 0.5, "Emissions": -0.7 },
			"No": { "GDP": -0.9, "R&D": -0.4, "Emissions": 0.6 }
		},
		"output": {
			"Yes": "Subsidizing nuclear energy can make it more accessible and support industry growth.",
			"No": "Without subsidies, energy costs may rise, affecting consumer affordability and demand."
		}
	},
	{
		"text": "Recently, France has initiated a pilot project for integrating nuclear energy with smart grid technology. Should the government expand support for such innovative projects?",
		"effects": {
			"Yes": { "GDP": 1.3, "R&D": 1.6, "Emissions": -1.3 },
			"No": { "GDP": -1.2, "R&D": -1.5, "Emissions": 1.2 }
		},
		"output": {
			"Yes": "Supporting innovative projects fosters technological advancement and enhances energy efficiency.",
			"No": "Limiting support may slow down innovation and reduce the effectiveness of energy systems."
		}
	},
	{
		"text": "Over the past few days, France has experienced a surge in renewable energy investments. Should the government balance this by equally investing in nuclear energy?",
		"effects": {
			"Yes": { "GDP": 1.4, "R&D": 0.8, "Emissions": -1.5 },
			"No": { "GDP": -1.3, "R&D": -0.7, "Emissions": 1.4 }
		},
		"output": {
			"Yes": "Balancing investments ensures a stable and diversified energy portfolio with lower emissions.",
			"No": "Focusing solely on renewables might lead to energy instability and higher emissions."
		}
	},
	{
		"text": "Recently, France has achieved a significant reduction in nuclear energy costs through technological improvements. Should the government reinvest these savings into further nuclear advancements?",
		"effects": {
			"Yes": { "GDP": 1.2, "R&D": 1.7, "Emissions": -1.0 },
			"No": { "GDP": -1.1, "R&D": -1.6, "Emissions": 0.9 }
		},
		"output": {
			"Yes": "Reinvesting savings can accelerate advancements and enhance the nuclear sector's efficiency.",
			"No": "Not reinvesting may slow progress and miss opportunities for further cost reductions."
		}
	},
	{
		"text": "In the last week, France has debated the environmental impact of nuclear energy compared to other sources. Should the government prioritize nuclear energy as the primary low-carbon energy source?",
		"effects": {
			"Yes": { "GDP": 1.5, "R&D": 1.4, "Emissions": -1.8 },
			"No": { "GDP": -1.4, "R&D": -1.3, "Emissions": 1.7 }
		},
		"output": {
			"Yes": "Prioritizing nuclear ensures a significant reduction in carbon emissions and supports economic growth.",
			"No": "Opting for other sources may not achieve the same level of emission reductions and could impact the economy."
		}
	}
]
}
