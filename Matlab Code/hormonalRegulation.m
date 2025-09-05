function new_position = hormonalRegulation(position, best_pos, pop_mean, lb, ub, S, Ea, Es)
    if rand() < 0.5
        sf = (ub - lb) * S ./ (1 + exp(Ea * (-position + Es)));
        new_position = pop_mean + rand() .* sf;
    else
        new_position = best_pos + rand() .* (pop_mean - position);
    end
end
