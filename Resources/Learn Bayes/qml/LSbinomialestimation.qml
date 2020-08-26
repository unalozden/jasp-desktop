//
// Copyright (C) 2013-2018 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//
import QtQuick			2.8
import QtQuick.Layouts	1.3
import JASP.Controls	1.0
import JASP.Widgets		1.0
import JASP				1.0
import "../qml/qml_components" as LS

Form {
	id: form

	LS.LSintrotext{}
	
	LS.LSbinomialdatainput
	{
		id:	binomialDataInput
	}

	Section
	{
		expanded: true
		title: qsTr("Model")
				
		ColumnLayout
		{
			spacing:				0
			Layout.preferredWidth:	parent.width

			RowLayout
			{
				Label { text: qsTr("Model");				Layout.preferredWidth: 280 * preferencesModel.uiScale}
				Label { text: qsTr("Distribution");			Layout.preferredWidth: 130 * preferencesModel.uiScale}
				Label { text: qsTr("Parameter (θ)");		Layout.preferredWidth: 150 * preferencesModel.uiScale}
			}

			ComponentsList
			{
				name:					"priors"
				optionKey:				"type"
				defaultValues: 			[]
				preferredHeight: 		90 * preferencesModel.uiScale
				rowComponent: 			RowLayout
				{
					Row
					{
						spacing:				4 * preferencesModel.uiScale
						Layout.preferredWidth:	285 * preferencesModel.uiScale
						TextField
						{
							label: 				""
							name: 				"name"
							value:				"Models " + rowIndex
							fieldWidth:			140 * preferencesModel.uiScale
							useExternalBorder:	false
							showBorder:			true
						}
					}
					Row
					{
						spacing: 4 * preferencesModel.uiScale
						Layout.preferredWidth: 110 * preferencesModel.uiScale
						DropDown
						{
							id: typeItem
							name: "type"
							useExternalBorder: true
							values:
							[
								{ label: qsTr("Spike"),		value: "spike"},
								{ label: qsTr("Beta"),		value: "beta"}
							]
						}
					}
					Row
					{
						spacing:				4 * preferencesModel.uiScale
						Layout.preferredWidth:	150 * preferencesModel.uiScale
						FormulaField
						{
							label:				qsTr("α")
							name:				"parAlpha"
							visible:			typeItem.currentValue === "beta"
							value:				"1"
							min:				0
							inclusive:			JASP.None
							fieldWidth:			70
							useExternalBorder:	false
							showBorder:			true
						}
						FormulaField
						{
							label:				qsTr("β")
							name:				"parBeta"
							visible:			typeItem.currentValue === "beta"
							value:				"1"
							min:				0
							inclusive:			JASP.None
							fieldWidth:			70
							useExternalBorder:	false
							showBorder:			true
						}
						FormulaField
						{
							label:				qsTr("θ₀")
							name:				"parPoint"
							visible:			typeItem.currentValue === "spike"
							value:				"0.5"
							min:				0
							max:				1
							inclusive:			JASP.None
							fieldWidth:			70
							useExternalBorder:	false
							showBorder:			true
						}
					}
				}
			}
		}
	}

	LS.LSestimationinference{}

	LS.LSestimationsequential
	{
		enabled: binomialDataInput.dataType.value !== "dataCounts"
		onEnabledChanged: if(!enabled) expanded = false
	}

	LS.LSestimationpredictions{}
}
