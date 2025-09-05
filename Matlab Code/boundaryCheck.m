function [ Position ] = BoundaryCheck(Position, lb, ub)

    for i=1:size(Position,1)
            FU=Position(i,:)>ub;
            FL=Position(i,:)<lb;
            Position(i,:)=(Position(i,:).*(~(FU+FL)))+ub.*FU+lb.*FL;
    end
end