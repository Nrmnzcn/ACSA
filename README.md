# Artificial Circulation System Algorithm

### Definition
In this study, we propose a novel method referred to as the Artificial Circulatory System Algorithm (ACSA). ACSA draws inspiration from the precise control and immediate adjustment of blood pressure and blood volume within the human circulatory system. The algorithm incorporates regulators within its mathematical framework that emulate the neural and hormonal systems found in its biological counterpart. These regulators enhance the optimization process at each iteration, thereby improving the overall performance of the algorithm. The innovative approach of ACSA aims to provide a new perspective in the optimization of complex systems.

### Inspiration
<div align="center">
    <img src="https://github.com/Nrmnzcn/ACSA-Algorithm/blob/main/image/Inspiration.jpg" alt="Inspiration" width="700" height="500">
</div>

### Workflow 

The ACSA, as mentioned earlier, is an algorithm that simulates the functioning of the circulatory system through various control mechanisms. The algorithm can be illustrated below. 

<div align="center">
    <img src="https://github.com/Nrmnzcn/ACSA-Algorithm/blob/main/image/Work-flow.jpg" alt="Workflow" width="450" height="800">
</div>

Similar to other metaheuristic approaches, the ACSA begins by creating a random initial population. Each type of regulator iteratively modifies its candidate solutions based on its specific objective function, utilizing mathematical calculations and parameters. This process improves the quality of potential solutions with each update. After every iteration of solution modifications, the algorithm checks the positions of the population to ensure that the solutions remain within the defined boundaries of the search space. If any solution is found outside the specified area, it is constrained to stay within the established search limits. During each iteration, the fitness values of the regulators are evaluated in relation to the objective function. The regulator with the highest fitness value is then recognized as the optimal solution within the population.

### Publication

You can find the full details of the algorithm in my publication:

- **Title**: Artificial Circulation System Algorithm: A Novel Bio-Inspired Algorithm
- **Authors**: Nermin Özcan, Semih Utku, Tolga Berber
- **DOI/Link**: [https://doi.org/10.32604/cmes.2024.055860](https://doi.org/10.32604/cmes.2024.055860)


### Citation Request

If you use this algorithm in your research, please cite the following paper:

```bibtex
@Article{cmes.2024.055860,
  AUTHOR = {Nermin Özcan, Semih Utku, Tolga Berber},
  TITLE = {Artificial Circulation System Algorithm: A Novel Bio-Inspired Algorithm},
  JOURNAL = {Computer Modeling in Engineering \& Sciences},
  VOLUME = {142},
  YEAR = {2025},
  NUMBER = {1},
  PAGES = {635--663},
  URL = {http://www.techscience.com/CMES/v142n1/58975},
  ISSN = {1526-1506},
  DOI = {10.32604/cmes.2024.055860}
}

```
### Libraries and Dependencies

The ACSA algorithm was developed using the following library and version:

- [Mealpy](https://github.com/thieu1995/mealpy) - versions 3.0.1

Additionally, the following libraries were utilized during the testing of the ACSA algorithm for benchmark functions and engineering design problems:

- [Opfunu](https://github.com/thieu1995/opfunu) - versions 1.0.1
- [Enoppy](https://github.com/thieu1995/enoppy) - versions 0.1.1

### Example

```python
# Import necessary libraries
import numpy as np
from mealpy.optimizer import Optimizer

# Define the objective function to minimize
def function(solution):
    return np.sum(solution**2)

# Define the problem parameters
problem = {
    "fit_func": function,
    "lb": [-3, 0, -3, -5.7, 1],
    "ub": [2.5, 5, 2, 19, 37],
    "minmax": "min",
}

# Define parameters of ACSA
epoch = 100
pop_size = 300
eh, en, sh, sn = 0.6, 1.8, 0.3, 0.002
nh_rate, scale = 0.2, 0.1

# Initialize and run the SMA algorithm
model = ACSA(epoch, pop_size, eh, en, sh, sn, nh_rate, scale)
best_position, best_fitness = model.solve(problem)
print(f"Solution: {best_position}, Fitness: {best_fitness}")
```

