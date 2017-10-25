//
// Copyright (C) 2013-2017 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#ifndef ANALYSISLOADER_H
#define ANALYSISLOADER_H

#include "analysis.h"
#include "version.h"

class AnalysisLoader
{
public:

	static Analysis *load(int id, std::string moduleName, std::string analysisName, const Version& version, Json::Value* data = NULL);

};

#endif // ANALYSISLOADER_H
