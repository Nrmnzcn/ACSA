function [new_position] = neuralRegulation(position, lb, ub, S, Ea, Es)
    sf = (ub - lb) * S ./ (1 + exp(Ea * (-position + Es)));
    new_position = position + rand() .* sf;
end