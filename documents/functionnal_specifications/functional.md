# Functional Specifications

## Table of content

- [Functional Specifications](#functional-specifications)
  - [Table of content](#table-of-content)
- [Introduction](#introduction)
  - [Overview](#overview)
  - [Project Definition](#project-definition)
    - [Vision](#vision)
    - [Objectives](#objectives)
    - [Scope](#scope)
      - [In Scope:](#in-scope)
      - [Out of Scope:](#out-of-scope)
    - [Target Audience](#target-audience)
    - [User Personas](#user-personas)
    - [Deliverables](#deliverables)
  - [Project Organization](#project-organization)
    - [Stakeholders](#stakeholders)
    - [Project Team](#project-team)
    - [Team Roles](#team-roles)
- [Functional Requirements](#functional-requirements)
  - [Serious Game Overview](#serious-game-overview)
    - [Theme](#theme)
    - [Game objectives](#game-objectives)
    - [Player Goals](#player-goals)
  - [Serious Game Design \& Mechanics](#serious-game-design--mechanics)
    - [Menu](#menu)
      - [1. Design](#1-design)
      - [2. mechanics](#2-mechanics)
    - [Map](#map)
      - [1. Design](#1-design-1)
      - [2. Mechanics](#2-mechanics-1)
    - [HUD (Heads-Up Display)](#hud-heads-up-display)
      - [1. Design](#1-design-2)
      - [2. Mechanics](#2-mechanics-2)
    - [Pin \& Icon System](#pin--icon-system)
      - [1. Design](#1-design-3)
      - [2. Mechanics](#2-mechanics-3)
- [Non-Functional Requirements](#non-functional-requirements)
  - [Performance Requirements](#performance-requirements)
  - [Usability Requirements](#usability-requirements)
  - [Maintainability Requirements](#maintainability-requirements)
  - [Portability Requirements](#portability-requirements)
- [Glossary](#glossary)

# Introduction

## Overview

We've been asked to create our own serious game using Godot and the GDSript language. Climate change is to be the main topic.

## Project Definition

### Vision 
---

Create and design a **serious game** with our own ideas and talk about **climat changes** in an **educational way**.

### Objectives
---

- Make a serious game.
- The topic must be climat change.
- Must be made using Godot.
- The programming language has to be GDScript.

### Scope
---

#### In Scope:

1. **Game Development**:
    
    - Develop a **serious game** that simulates geopolitical and ecological decision-making based on climate change.
    - Include a **zoomable planisphere** with real-time indicators of ecological, economic and geopolitical states.
    - Implement gameplay mechanics to:
        - Create and update **legal restrictions** to influence industries.
        - Modify or destroy industrial activities to reduce environmental impact.
        - Invest in **research and development** on a national, continental, or global level.
2. **Realistic Simulation**:
    
    - Ensure that actions and their consequences unfold over time, reflecting **real-world dynamics**.
    - Incorporate **realistic representations** of ecological and political challenges without oversimplifying mechanics.
3. **Educational Features**:
    
    - Provide **real-time feedback** to players, showing them the results of their decisions, for example:
        - Changes in global temperature.
        - Improved or degraded ecosystems.
        - Economic and political ripple effects.
    - Teach players about the interconnectedness of environmental, political, and industrial systems.
4. **Technical Details**:
    
    - Use the **Godot Engine** for development.
    - Program the game entirely with **GDScript**.
    - Ensure immersive gameplay with **2D graphics**, and a **clear focus on educational goals**.
5. **Delivery**:
    
    - Deliver a **playable prototype** that demonstrates all the above-mentioned functionalities.

#### Out of Scope:

1. **Commercial Release**:
    
    - The game will not be published for commercial purposes.
    - No marketing, distribution, or monetization activities will be undertaken.
2. **Multiplayer or Complex Online Features**:
    
    - The game will not include multiplayer elements or large-scale online connectivity.
3. **Expansions Beyond Initial Scope**:
    
    - The scope of application is limited to the specified gameplay features and will not include extensions such as:
        - Deep space exploration.
        - Historical or speculative timelines outside of the modern era.
4. **Porting to Other Platforms**:
    
    - The game will not be supported to other engines or platforms other than the Godot Engine for PC.

### Target Audience
---

This serious game is aimed at people aged **14 and over**, in particular students, educators and environmentally conscious gamers. This audience is interested in **learning about climate change**, exploring **geopolitical and ecological interactions**, and understanding the **real-world challenges** of balancing environmental, economic and political decisions. The game is designed to be both educational and engaging, and is aimed at both **casual gamers** and those with a deeper interest in environmental science and policy.

### User Personas
---

| **Persona**                 | **Description**                                                                                      | **Profile Image**                                                                                   |
|-----------------------------|------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| **Alex, High School Student** | 16-year-old student interested in science and geography. Curious about the effects of climate-related decisions. | ![Alex](pictures/persona1.webp) |
| **Dr. Rachel, Environmental Science Teacher** | 34-year-old high school teacher passionate about inspiring her students with engaging educational tools. | ![Dr. Rachel](pictures/persona2.webp) |
| **Mark, Aspiring Policy Maker** | 21-year-old university student seeking to understand global political decisions and their ecological impact. | ![Mark](pictures/persona3.webp) |


### Deliverables
---

| Name | Type | Deadline |
| --- | --- | --- |
| Functional Specifications Document	 | Document (markdown) | 11/22/2024 |
| Technical Specifications Document | Document (markdown) | 11/29/2024 |
| Test Plan and Test Cases | Document (markdown) | 12/06/2024 | 
| User Manual | Document (PDF) | 12/13/2024 | 
| Code | Code | 12/13/2024 |
| Weekly reports | Document (markdown) | Every Friday | 


## Project Organization
### Stakeholders
---

| Name | Occupation | Links |
| --- | --- | --- |
| ALGOSUP | Client | [Website](https://algosup.com) |

### Project Team
---

| **Picture**                                                                                     | **Name**               | **Role**          | **Links**                                                                                                                                       |
| ----------------------------------------------------------------------------------------------- | ---------------------- | ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| <img alt="https://github.com/devnjoyer" src="https://ca.slack-edge.com/T019N8PRR7W-U07EAF5MLU8-cbf39e86ee82-192" width=150 /> | **Yann-Maël Bouton**  | Project Manager   | [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbqj9Ii13d6hx5a9kyLnC5A8A96LDSaSZv_w&s" alt="GitHub" width="30">](https://github.com/devnjoyer) [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRALyVA0K3z9C2yeZhRpUG7LGbVzLJD8ZmcZReeui69NRx2xonJ3JR5MhTfdFdE-NFSE&usqp=CAU" alt="LinkedIn" width="30">]() |
| <img alt="https://github.com/LucasMegnan/LucasMegnan" src="https://ca.slack-edge.com/T019N8PRR7W-U05TC0L2L8Z-6ce77a307eec-192" width=150 /> | **Lucas Megnan**  | Program Manager   | [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbqj9Ii13d6hx5a9kyLnC5A8A96LDSaSZv_w&s" alt="GitHub" width="30">](https://github.com/LucasMegnan/LucasMegnan) [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRALyVA0K3z9C2yeZhRpUG7LGbVzLJD8ZmcZReeui69NRx2xonJ3JR5MhTfdFdE-NFSE&usqp=CAU" alt="LinkedIn" width="30">](https://www.linkedin.com/in/lucas-megnan/) |
| <img alt="https://github.com/Boppalex" src="https://avatars.githubusercontent.com/u/123485791?s=400&u=e93cf97c3ac219fcd1419a99ad6fe934ab2a49f2&v=4" width=150 /> | **Alexandre Bopp** | Technical Leader  | [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbqj9Ii13d6hx5a9kyLnC5A8A96LDSaSZv_w&s" alt="GitHub" width="30">](https://github.com/Boppalex) [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRALyVA0K3z9C2yeZhRpUG7LGbVzLJD8ZmcZReeui69NRx2xonJ3JR5MhTfdFdE-NFSE&usqp=CAU" alt="LinkedIn" width="30">](https://www.linkedin.com/in/alexandre-bopp-682a97250/) |
| <img alt="https://github.com/EnoGame29" src="https://avatars.githubusercontent.com/u/182214526?v=4" width=150 /> | **Enoal Adam**    | Technical Writer  | [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbqj9Ii13d6hx5a9kyLnC5A8A96LDSaSZv_w&s" alt="GitHub" width="30">](https://github.com/EnoGame29) [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRALyVA0K3z9C2yeZhRpUG7LGbVzLJD8ZmcZReeui69NRx2xonJ3JR5MhTfdFdE-NFSE&usqp=CAU" alt="LinkedIn" width="30">](https://www.linkedin.com/in/enoal-adam-02552932a/) |
| <img alt="https://github.com/Amakran2003" src="https://avatars.githubusercontent.com/u/145991267?v=4" width=150 /> | **Abdrazaq Makran** | Software Engineer | [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbqj9Ii13d6hx5a9kyLnC5A8A96LDSaSZv_w&s" alt="GitHub" width="30">](https://github.com/Amakran2003) [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRALyVA0K3z9C2yeZhRpUG7LGbVzLJD8ZmcZReeui69NRx2xonJ3JR5MhTfdFdE-NFSE&usqp=CAU" alt="LinkedIn" width="30">](https://www.linkedin.com/in/abderrazaq-makran/) |
| <img alt="https://github.com/4tinley" src="https://avatars.githubusercontent.com/u/177563503?v=4" width=150 /> | **Vianney Polard**   | Quality Assurance | [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbqj9Ii13d6hx5a9kyLnC5A8A96LDSaSZv_w&s" alt="GitHub" width="30">](https://github.com/4tinley) [<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuRALyVA0K3z9C2yeZhRpUG7LGbVzLJD8ZmcZReeui69NRx2xonJ3JR5MhTfdFdE-NFSE&usqp=CAU" alt="LinkedIn" width="30">](https://www.linkedin.com/in/vianney-polard-44173a273/) |

### Team Roles
---

| Role | Description |  
| --- | --- |
| **Project Manager** | Responsible for overall project planning, coordination and communication. |
| **Program Manager** | Responsible of deadlines and deliverables. Designs of the project are under his direction. Should deliver the functional specification. |
| **Technical Leader**| Guides the game's technical development and architectural decisions, ensuring the implementation of best practices and high-quality code. |
| **Softawre Engineer** | Develops and implements game code, focusing on gameplay mechanics, user interface and system performance. |
| **Quality Assurance** | Ensures the game meets high standards by looking for bugs, performance issues, and overall functionality across different scenarios. |
| **Technical Writer** | Responsible for project documentation the project and creation of user manuals. |

# Functional Requirements

## Serious Game Overview

### Theme
---

The game, Ecosphere, immerses players into a global crisis scenario, challenging them to confront and mitigate the devastating effects of climate change. In shoes of decision-makers, players will navigate the complex interplay of **economy, politics, and environmental sustainability**, learning first-hand the difficulties of implementing effective climate solutions in the real world.

Players are responsible for:

- **Passing laws** to regulate industries and reduce environmental damage.
- **Investing in research and green technologies** to promote sustainable development.
- **Managing geopolitical challenges while balancing** national and global interests.

Each action has consequences: reducing emissions could improve environmental health, but at the expense of economic growth, while prioritizing economic activity could accelerate ecological decline. Real-time feedback, such as visualized data on rising temperatures, fluctuating CO₂ levels and ecosystem recovery, helps players see the tangible results of their decisions.

This simulation teaches that solving climate challenges requires strategic thinking, collaboration and long-term commitment, showing how even incremental changes can lead to meaningful impacts.

### Game objectives
---

**1.** **Educate and Engage**: Help players understand the interconnectedness of economic, environmental and political systems in the context of climate change.

**2.** **Encourage Strategic Thinking**: Challenge players to develop thoughtful strategies that balance short-term and long-term goals.

**3.** **Raise Awareness**: Provide an immersive experience that highlights the complexity and urgency of global climate action.

**4.** **Foster Actionable Knowledge**: Provide players with insights about real-world climate solutions and envourge them to advocate or implement sustainable practices in their lives.

### Player Goals
---

**1. Reverse Climate Change**: Take decisive action to reduce global carbon emissions, halt deforestation, and curb environmental degradation.

**2. Achieve Sustainability**: Balancing ecological, economic and social factors to create a stable and thriving global system.

**3. Optimize Resources**: Efficiently allocate limited resources across regions, industries and technologies to maximize impact.

**4. Maintain Global Stability**: Address geopolitical tensions and social unrest while pursuing environmental goals.

**5. Innovate for the Future**: Invest in cutting-edge technologies and deploy them to solve complex climate challenges.

**6. Adapt and Learn**: Respond to emerging crises and evolving scenarios with flexibility and strategic foresight.

Players will have to plan, implement and adapt their decisions as they strive to create a sustainable future for the planet.

## Serious Game Design & Mechanics

### Menu

#### 1. Design
---

The design is very simple, with the name of the game at the top middle of the screen, and the **'play'**, **'How to Play'** and **'Quit'** buttons.

![EcoSphere](pictures/EcoSphere.png)

#### 2. mechanics
---

![FlowchartMenu](pictures/FlowchartMenu.png)

### Map

#### 1. Design
---

- A **zoomable 2D world map** featuring interactive elements such as:
  - Nations.
  - Climate and industrial indicators.
  - Geopolitical status.

![base_map](pictures/base_map.png)

#### 2. Mechanics
---

- Players can:
  - Enact policies at a **national scale**.
  - Monitor global **ecological conditions** via map overlays.
  - Track **progress indicators** like CO₂ levels or deforestation rates.

![FlowcharMenu](pictures/FlowchartMap.png) 

### HUD (Heads-Up Display)

#### 1. Design
---

- A clean, intuitive interface that provides **real-time data** enabling players to monitor the impact of their decisions and plan their next steps.
- Key HUD elements include:

    **1. Resource Meters**:
    - **Funds**: Displays economic resources available for policy, research, and development.
    - **Global Emissions**: Shows current CO₂ production and its evolution over time.
    - **Planet Health Indicators**: Tracks metrics like global temperature, deforestation rate and biodiversity index.
  
    **2. Country-Specific Data**:
    - **GDP** (Gross Domestic Product): Indicates a country’s economic capacity and determines available resources for investment or scientific research.
    - **Scientific Progress Bar**: Visualizes ongoing research activities and their completion deadlines.
  
    **3. Player Feedback Panel**:
    - Shows the results of players' decisions in terms of **ecological, economic and geopolitical changes**.
    - Critical **alerts** for disasters or urgent matters.

    **4. Map Interaction Menu**:
    - Access national data, legislation, industry sectors and global overlays.

**HUD of the world map:**

![WorldHUD](pictures/WorldMapHUD.png)

**HUD of a country map:**

![CountryHUD](pictures/CountryMapHUD.png)

#### 2. Mechanics
---

- The HUD dynamically updates according to player actions and global events:
  - **Funds and GDP**:
    - **GDP** rises or falls according to the country's policies and industrial activities.
    - Allocate a percentage of GDP to **scientific research** for technological advances or sustainable solutions.
  - **Scientific Research System**:
    - Players can fund scientists to research **new technologies** or **climate solutions**.
    - Carried research out leads to tools like **renewable energy technologies**, **carbon capture systems** or **drought-resistant crops**.
    - Research projects require time and are influenced by **funding levels** and **geopolitical stability**.
  - **Planet Health Metrics**:
    - Real-time feedback on environmental trends to help players assess the effectiveness of their strategies.
    - Includes visible consequences like sea-levels rise, desertification and ecosystem restoration.
  - **Alert Notifications**:
    - Warns players of critical issues such as **natural disasters**, **political unrest** or **scientific breakthroughs**.

**Integration of GDP and Research**

- GDP acts as the **financial backbone**:
  - Players must maintain GDP to fund **research** while minimizing environmental damage.
  - Excessive industrial expansion may temporarily increase GDP, but leads to higher **emissions** and **ecological degradation**.
- The **scientific research system** challenges players to:
  - Prioritize research areas according to current global challenges.
  - Balance short-term GDP sacrifices with long-term sustainability goals. 



### Pin & Icon System

#### 1. Design
---

We have 4 categories :

We have defined five main categories in agriculture, each representing a key area that affects zone ecological status. These categories can be improved to reduce environmental impact and improve sustainability.

| Agriculture | Description | Icon |
|-------------|-------------|------|
| **Livestock** | Represents the impact of livestock farming on the environment, including greenhouse gas emissions, water usage comsumption and soil degradation. Improvements in this category may focus on sustainable livestock practices, waste reduction and animal welfare. | ![godot](pictures/agriculture/icons8-panneau-bovins-60.png) |
**Crops**            | Covers the production and management of various crops. Focus is on soil health, pesticide use, water conservation and crop rotation. Those improvements here can lead to reduce chemical runoff and improve resilience to climate change. | ![godot](pictures/agriculture/icons8-champ-50.png) |

<br>

| Transport    | Description                                                                                                                                    | Icon                                             |
|--------------|------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| **Car**      | Represents the environmental impact of personal and small vehicle transportation, including emissions and fuel consumption. Upgrades may focus on reducing carbon production, promoting electric vehicles, and increasing fuel efficiency. | ![car](pictures/transport/icons8-berline-60.png) |
| **Bus/Truck** | Encompasses larger land vehicles used for public and freight transportation. This category emphasizes emissions reduction, fuel optimization, and transitioning to sustainable energy sources. | ![bus_truck](pictures/transport/icons8-navette-50.png) |
| **Subway**   | Represents underground or metropolitan rail networks, which generally offer lower emissions per passenger. Improvements in this category could enhance energy efficiency and optimize route planning to reduce impacts. | ![subway](pictures/transport/icons8-métro-48.png) |
| **Boat**     | Focuses on the impact of water-based transport, from cargo ships to personal boats. Main areas include fuel emissions, wastewater management and transition to cleaner energy sources. | ![boat](pictures/transport/icons8-yacht-50.png) |
| **Plane**    | Represents the environmental impact of air travel, which is a significant source of greenhouse gas emissions. Upgrades may include carbon offsetting programs, energy efficiency improvements and investments in alternative fuels. | ![plane](pictures/transport/icons8-décollage-d'avion-50.png) |

<br>

| Energy Systems           | Description                                                                                                          | Icon                                             |
|--------------------------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| **Coal Combustion**      | Electricity generation by coal combustion, which results in high carbon emissions and pollution. Upgrades focus on reducing coal dependency and improving efficiency. | ![coal combustion](pictures/energy/icons8-charbon-de-bois-50.png) |
| **Fossil Fuels**         | General energy production from fossil fuels, such as oil and coal, which contribute to greenhouse gas emissions. Improvements aim to reduce reliance on these non-renewable resources. | ![fossil fuels](pictures/energy/icons8-industrie-pétrolière-50.png) |
| **Gas** | Electricity production using natural gas, which emits less CO₂ than coal but still has an environmental impact. Improvements are primarily intended to improve plant efficiency or transitioning to cleaner alternatives. | ![gas](pictures/energy/icons8-usine-50.png) |
| **Nuclear**              | Electricity production using nuclear energy, which has low greenhouse emissions but involves radioactive waste management. Enhancements may focus on waste reduction and safety measures. | ![nuclear](pictures/energy/icons8-centrale-nucléaire-50.png) |
| **Green Energy**         | Renewable energy sources like wind turbines and solar panels, providing clean alternatives to fossil fuels. Upgrades expand renewable energy capacity and efficiency. | ![green energy](pictures/energy/icons8-énergieverte-50.png) |

<br>

| Industry           | Description                                                                                                      | Icon                                             |
|--------------------|------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| **Metals**         | Encompasses the extraction and processing of metals, which often involves high energy consumption and emissions. Key improvements focus on energy efficiency and reducing industrial waste. | ![metals](pictures/industry/icons8-minerai-de-fer-60.png) |
| **Chemicals**      | Involves the production of chemicals, which typically requires significant energy input and generates hazardous byproducts. Upgrades may focus on cleaner production methods and waste management. | ![chemicals](pictures/industry/icons8-tube-à-essai-fin-50.png) |
| **Waste**          | Includes the processing and management of waste materials, often requiring high energy input for waste incineration and disposal. Efforts here focus on improving recycling and reducing environmental impact. | ![waste](pictures/industry/icons8-déchets-50.png) |
| **Cement**         | The cement industry is a major emitter of CO₂, primarily due to the high energy needs for limestone processing. Enhancements include reducing carbon emissions and improving energy efficiency. | ![cement](pictures/industry/icons8-sac-de-ciment-50.png) |
| **Other Industry** | Covers various industries that do not fall under the above categories, often characterized by energy-intensive processes. Improvements may target specific energy reductions or emissions control measures. | ![other industry](pictures/industry/icons8-statut-de-connexion-off-50.png) |


#### 2. Mechanics
---

Directly on the map, when zoom in to a country, you will see a top view of the country with multiple pins placed inside. Each pin represents a specific category, and within the pin, you will see the corresponding icons we previously discussed, depending on the category.

Example :

| Map Pin  | Icon | 
|----------|------|
|![map pin](pictures/icons8-marqueur-50.png)|![metals](pictures/industry/icons8-minerai-de-fer-60.png)|

Directly on the map, when zoom in to a country, you will see a top view of the country with multiple pins placed inside. Each pin represents a specific category, such as the **Metals Industry** and inside the pin, you will see the corresponding icons associated with that category.

Additionally, the color of each map pin will change based on the ecological **color state** that we defined earlier. The color of the pin reflects the current state of the environment in that specific area (Green, Yellow, Orange, Red, Black), indicating the urgency of intervention or improvement needed.

---

All designs & mechanics can evolve during the development of the serious game.
All our Information come from the website : [Worldemission.io](https://worldemissions.io/?campaignid=20369193522&adgroupid=155060989647&adid=665839090473&utm_term=co2%20emissions%20by%20country&utm_campaign=World+Emissions+Clock&utm_source=adwords&utm_medium=ppc&hsa_acc=3460487076&hsa_cam=20369193522&hsa_grp=155060989647&hsa_ad=665839090473&hsa_src=g&hsa_tgt=kwd-489531936952&hsa_kw=co2%20emissions%20by%20country&hsa_mt=b&hsa_net=adwords&hsa_ver=3&gad_source=1&gclid=CjwKCAiArva5BhBiEiwA-oTnXWDYR0cr3v6u_4X9h-s2HxtYd7UgZNEKtFOlrfGHee3CXUc9_73H2xoCjskQAvD_BwE)

# Non-Functional Requirements

## Performance Requirements
---

1. **Game Performance**:
   - The game must maintain a consistent **60 frames per second (FPS)** on mid-tier computers (e.g., with at least 8GB of RAM, 2GB VRAM, and a mid-range CPU).
   - Loading times for large assets like the map and overlays must not exceed **5 seconds**.

2. **Responsiveness**:
   - All user interactions, such as map zooming or enacting policies, should have a response time of **under 200ms**.

3. **Scalability**:
   - The system should handle increasing levels of complexity as more policies, overlays, and events are added without significant degradation in performance.

## Usability Requirements
---

1. **Intuitive Design**:
   - The game interface must be easy to navigate for users aged 14 and above, with **clear User Manual** and **contextual tooltips** explaining key features.
   - Ensure minimal cognitive load by presenting **critical information upfront** and providing an optional **in-depth exploration menu** for advanced players.

## Maintainability Requirements
---

1. **Modular Codebase**:
   - Code must be written in a **modular and reusable** way to allow future updates and bug fixes without significant refactoring.
   - All GDScript files must follow a clear structure, with well-documented functions and consistent naming conventions.

2. **Version Control**:
   - Use Git for source code management, ensuring all changes are tracked with meaningful commit messages.

More information on the Technical Specification.

## Portability Requirements
---

1. **Operating System Compatibility**:
   - The game must run on **Windows** and **macOS** systems.
   - The game is available on our GitHub.

# Glossary

| **Term**                  | **Definition**                                                                                                                                                                     |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Serious Game**           | A game designed for educational purposes, focusing on teaching players about real-world challenges, such as climate change, while still being engaging and interactive.             |
| **Godot Engine**           | An open-source game development platform used to create 2D and 3D games.                                                                                                         |
| **GDScript**               | A high-level, dynamically-typed programming language used in the Godot Engine, optimized for game development.                                                                    |
| **Zoomable Planisphere**   | A 2D interactive world map that players can zoom in or out to view regions at different levels of detail.                                                                         |
| **GDP (Gross Domestic Product)** | A measure of a nation's total economic output, used in the game to determine the availability of resources for research, policies, and development.                                   |
| **Scientific Research System** | A gameplay mechanic allowing players to fund and direct research projects to discover and unlock new climate solutions or technologies.                                          |
| **CO₂ Levels**             | A metric representing the concentration of carbon dioxide in the atmosphere, a key factor in global warming.                                                                      |
| **Planet Health Metrics**  | Indicators used to visualize the state of the planet's environment, such as global temperature, biodiversity, and deforestation rates.                                             |
| **Modular Codebase**       | A software development practice where code is divided into smaller, independent modules, making it easier to update and maintain.                                                  |
| **Colorblind-Friendly Mode** | A feature that adjusts in-game colors to ensure that colorblind players can distinguish important visual elements.                                                               |
| **Accessibility**          | Design practices that ensure the game can be played by a wide range of people, including those with disabilities or impairments.                                                  |