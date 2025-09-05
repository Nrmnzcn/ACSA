%__________________________________________________________________________
%            Artificial Circulation System Algorithm source code 
%
%                        programming: Nermin Özcan
%
%                  Özcan, N., Utku, S., Berber, T. (2025)
% Artificial Circulation System Algorithm: A Novel Bio-Inspired Algorithm 
%        Computer Modeling in Engineering & Sciences, 142(1), 635–663. 
%                  https://doi.org/10.32604/cmes.2024.055860
%  
%                      E-mail: nermin.ozcan@iste.edu.tr
%__________________________________________________________________________

function [Best_score, Best_pos, Convergence_curve] = ACSA(Regulators_no, Max_iter, lb, ub, dim, fobj, NH_rate, S)

    % Fixed parameters,
    Ea_neural = 1.8;
    Es_neural = 0.002;
    Ea_hormonal = 0.66;
    Es_hormonal = 0.33;
    
    % Popülasyonu başlat
    Positions = initialization(Regulators_no, dim, ub, lb);
    
    fitness = zeros(1, Regulators_no);
    Convergence_curve = zeros(1, Max_iter);

    % Optimizasyon döngüsü
    for iter = 1:Max_iter
    
        % Fitness değerlerini hesapla
        for i = 1:Regulators_no
            fitness(i) = fobj(Positions(i, :));
        end
        
        [Best_score, best_idx] = min(fitness);
        Best_pos = Positions(best_idx, :);
        pop_mean = mean(Positions, 1);

        % Fitness'a göre sırala (BÜYÜKTEN KÜÇÜĞE)
        [~, sorted_idx] = sort(fitness, 'descend');
        
        % Nöral ve hormonal grupları ayır
        neural_size = round(Regulators_no * NH_rate);
        
        % TEK DÖNGÜ ile güncelleme
        for i = 1:Regulators_no
            idx = sorted_idx(i);  % Sıralı indekslerden birini al
            
            if i <= neural_size
                % NÖRAL GÜNCELLEME
                new_pos = neuralRegulation(Positions(idx, :), lb, ub, S, Ea_neural, Es_neural);
            else
                % HORMONAL GÜNCELLEME
                new_pos = hormonalRegulation(Positions(idx, :), Best_pos, pop_mean, lb, ub, S, Ea_hormonal, Es_hormonal);
            end

            % Yeni pozisyonun band kontrolü yap
            new_pos = boundaryCheck(new_pos, lb, ub);

            % Yeni pozisyonu değerlendir
            new_fit = fobj(new_pos);
            
            % Eğer yeni pozisyon daha iyiyse, güncelle
            if new_fit < fitness(idx)
                Positions(idx, :) = new_pos;
                fitness(idx) = new_fit;
            end
        end
        
        % En iyi çözümü güncelle
        [current_best, best_idx] = min(fitness);
        if current_best < Best_score
            Best_score = current_best;
            Best_pos = Positions(best_idx, :);
        end
        
        Convergence_curve(iter) = Best_score;
    end
end

