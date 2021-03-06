%Input:
% partMat:      the particle matrix to where the strengths will be
%               added to 
% CAVerletList: the verlet list for the CA to know which particles
%               are in the vincinity of the lysed cell
% cellLocation: the coordinates of the cell that lysed
% totalVirus:   the amount of virus to distribute amongst the pse particles
% gridSizeX:    the size of the grid in the x-dimension
% strengthDim:  which dimension in the partMat should the strengths
%               be added to
%Output:
% partMat:      the particle matrix with the virus amounts added to
%               the associated particles strengths
%function partMat =  addVirusToParticleStrengths(partMat, ...
%   CAVerletList, cellLocation, totalVirus)

function partMat =  addVirusToParticleStrengths(partMat, ...
                       cellAreaList, cellLocation, totalVirus, gridSizeX, strengthDim)

% use the CAVerletList to know which particles to add strengths to

%convert the cellLocation to the CAVerletList index
CAListPos = CAVerletListPosition(cellLocation,gridSizeX);

%add the appropriate amount of virus to each of the particles

partDist = cellAreaList{CAListPos};

partMat(partDist(:,1), strengthDim) = partMat(partDist(:,1), strengthDim) ...
    + totalVirus*partDist(:,3);

end

function CAVListPos = CAVerletListPosition(gridPos, sizeX)
    CAVListPos = (gridPos(2)-1)*sizeX + gridPos(1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     Infectio - a virus infection spread simulation platform
%     Copyright (C) 2014-2015  Artur Yakimovich, Yauhen Yakimovich
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.