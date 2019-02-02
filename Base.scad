$fn = 80;

innerWidth = 22.5;
innerLength = 68;
innerCornerRadius = 3.7;
slabThickness = 5;
motorHeight = 20;
slabHeight = motorHeight / 2 + slabThickness;
wireHoleXPos = 6.8;
wireHoleWidth = 6.8;
wireHoleHeight = 2.3;

motorShaftGapWidth = 12.4; //7
motorShaftGapLength = 45;
motorShaftGapRadius = motorShaftGapWidth / 2;
motorShaftGapX = (innerWidth - motorShaftGapWidth) / 2 + slabThickness;
motorShaftGapY = 7.7;

MotorScrewY = 32;
MotorScrewRadius = 1.7;
MotorScrewGap = 17.7;

totalWidth = innerWidth + 2 * slabThickness;
totalLength = innerLength + 2 * slabThickness;
totalHypotenus = sqrt(pow(totalWidth, 2) + pow(totalLength,2));
roundedCornerCompromise = (innerCornerRadius + slabThickness) / cos (45) - innerCornerRadius;

jointHeight = (totalHypotenus) * sin(45) - roundedCornerCompromise + .39 - 26;

// Hinges
hingeHeight = 38.5;
comfortGap = 0.2;
bearingXposition = 22.2;
innerWidthAdj = innerWidth - 1.5*slabThickness;

// Upper and Rear
rearWheelTopLength = 82;
rearWheelLength = rearWheelTopLength + 113.55;

screwDistanceFromFrontNose = 11.3;
clampScrewGap = 15;
clampScrewDistanceFromFrontNose = screwDistanceFromFrontNose + 57;
bearingInnerConnectorDiameter = 13.5;

// Body Mount
bodyConnectorDiameter = 12;
bodyConnectorSideWidth = sqrt(32) + 0.5;
bodyConnectorShaftLength = 30;
bodyConnectorShaftEnd = slabThickness; 
bodyConnectorShaftScrewLength = 14;
bodyConnectorShaftScrewDiameter = 1.9;
bodyConnectorSideWidthOffset = 0.2;

// Body Design
bodyMountScrewHeadHeight = 2;
bodyMountScrewHeadDiameter = 5.6;
bodyMountScrewHoleDiameter = 2.4;
bodyMountGuidingSquareHeight = 0.75;

bodyMountScrewOffset = 6.5;
bodySideLength = 80;
bodySideWidth = 58;
bodyHeight = innerWidth + 2 * slabThickness;
bodyMountDistanceFromNose = 31;
arduinoXOffset = 30;
arduinoYOffset = 9;
lidScrewOffset = 8;

// Bearing Separator
bearingSeparatorDiameter = 12; //11.5;
bearingSeparatorHeight = 6;
bearingWidth = 7;

// Main Body
bodyInnerWidth = 58;

// Battery holder
battrHolderHeight = 57.5; battrHolderHalfwidth = 19.5; height = slabHeight; screwRadius = 1.5;

// Body Hinges
hingeHeightFromBase = 11;
gapBetween = slabThickness + 0.7;
hingeThickness = slabThickness;

//mirror()
//    DrawUpperAndRear();

//drawHollow(motorMount = true, centerMount = true, hollowWidth = bodyInnerWidth + slabThickness * 2 , drawWireSpace = false, isHollow = false, motorMount = false, drawBodyMounts = true, drawBackMount = true, cutTop = true, drawArduino = true, drawLidHoles = true, drawWireHole = true);

//drawBodyLid(drawArduino = true, drawWireHole = true, drawWireHoleXRelPercPosition = 60, drawBatteryHolder = false, drawHinge = false, drawServo = false);

//drawBodyLid(drawArduino = true, drawWireHole = false, drawHinge = true, drawServo = true);

//DrawBodyConnector();

//DrawRoundedStandoff(height = 11);

//DrawShaftConnector();

connectorRadiusInner = 1.65; // 3mm screw should fit around it
connectorRadiusOuterDelta = 1.5; // The thickness around the inner radius
connectorHingeSpace = .5; // Space between the connector and hinge - must allow free movement
connectorHingeThickness = 1.3; // Must be stron enough to hold the connector
gimpalShaftWidth = 5; //  
clampHeight = 8;

clampHalfWidth = (connectorRadiusInner + connectorRadiusOuterDelta + connectorHingeSpace + connectorHingeThickness);
connectorOuterDiameter = connectorRadiusInner + connectorRadiusOuterDelta;


mountingPlateRadiusTop = 4;
mountingPlateRadiusBottom = 1;
mountingPlateWidth = 30; // 17;
mountingPlateLength = 24;
mountingPlateHeight = clampHalfWidth * 2;
mountingPlateScrewHeadHeight = 3.5;
mountingPlateScrewXOffset = 10;
mountingPlateScrewYOffset = 15;
gimpalFreeMoveSpaceX = gimpalShaftWidth + 0.3;
gimpalFreeMoveSpaceY = 18;

module DrawMountingPlate(mountingPlateRadiusTop = mountingPlateRadiusTop, mountingPlateWidth = mountingPlateWidth)
{

    difference()
    {
        hull()
        {
            for(y = [0: 1])
            translate([0, mountingPlateRadiusTop + y * (mountingPlateLength - 2 * mountingPlateRadiusTop), mountingPlateHeight - mountingPlateRadiusTop])
            rotate(a = 90, v = [0, 1, 0])
                cylinder(r = mountingPlateRadiusTop, h = mountingPlateWidth);

            for(y = [0: 1])
            translate([0, mountingPlateRadiusBottom + y * (mountingPlateLength - 2 * mountingPlateRadiusBottom), mountingPlateRadiusBottom])
            rotate(a = 90, v = [0, 1, 0])
                cylinder(r = mountingPlateRadiusBottom, h = mountingPlateWidth);
        }

        // draw the munting gimpal screw
        translate([0, mountingPlateLength / 2, screwRadius + clampHalfWidth])
        {
                rotate(a = 90, v = [0, 1, 0])
                    cylinder(r = screwRadius, h = mountingPlateWidth);

            rotate(a = 90, v = [0, 1, 0])
                cylinder(r = bodyMountScrewHeadDiameter / 2, h = mountingPlateScrewHeadHeight);

        translate([mountingPlateWidth - mountingPlateScrewHeadHeight, 0, 0])
            rotate(a = 90, v = [0, 1, 0])
                cylinder(r = bodyMountScrewHeadDiameter / 2, h = mountingPlateScrewHeadHeight);

        }

        // draw the gimpal hole
        translate([(mountingPlateWidth - gimpalFreeMoveSpaceX) / 2, (mountingPlateLength - gimpalFreeMoveSpaceY) / 2, 0])
            cube([gimpalFreeMoveSpaceX, gimpalFreeMoveSpaceY, mountingPlateWidth]);

        // Draw mounting screw
        centerX = (mountingPlateWidth - mountingPlateScrewXOffset) / 2;
        centerY = (mountingPlateLength - mountingPlateScrewYOffset) / 2;
        for(y = [0: 1])
        for(x = [0: 1])
        {
            translate([x * mountingPlateScrewXOffset + centerX, y * mountingPlateScrewYOffset + centerY,0])
                cylinder(r = screwRadius, h = mountingPlateHeight);
            translate([x * mountingPlateScrewXOffset + centerX, y * mountingPlateScrewYOffset + centerY, mountingPlateHeight - mountingPlateScrewHeadHeight])
                cylinder(r = bodyMountScrewHeadDiameter / 2, h = mountingPlateScrewHeadHeight);
        }


    }
}


module DrawShaftConnector(connectorOuterDiameter = connectorOuterDiameter, 
                            connectorDiameter = connectorRadiusInner * 2, 
                            clampHalfWidth = clampHalfWidth,
                            shaftConnectorHeight = gimpalShaftWidth
)
{
    squareSide = connectorDiameter * cos(45);

    difference()
    {
        translate([0,0,0])
        {
            linear_extrude(height = squareSide)
                circle(r = connectorOuterDiameter, center = true);

            linear_extrude(height = squareSide)
                square([ clampHalfWidth * 2, squareSide], center = true);
        }
        cylinder(r = connectorDiameter / 2, h = squareSide);
    }
}

module DrawShaftClamp(connectorDiameter = connectorRadiusInner * 2, 
                            clampHeight = clampHeight,
                            gimpalShaftWidth = gimpalShaftWidth,
                            clampHalfWidth = clampHalfWidth,
                            connectorHingeThickness = connectorHingeThickness)
{
    // from the outer radius of the connectorDiameter (connectorOuteDiameter / 2 + )
    // add a small factor to get the total free rolling radius (default = .3 + .3)
    // add the factor for the hinge (2.2)

    difference()
    {

        translate([0,0,0])
        {
            translate([-gimpalShaftWidth / 2,0,0])
                linear_extrude(height = clampHalfWidth)
                    square([gimpalShaftWidth , clampHeight]);

            cylinder(r = gimpalShaftWidth / 2, h = clampHalfWidth);
        }

        innerCurveRadius = clampHalfWidth - connectorHingeThickness;

        translate([-gimpalShaftWidth / 2, 0,  clampHalfWidth])
        rotate(a = 90, v = [0,1,0])
        hull()
        {
            for(y = [0:1])
            translate([0, -y * gimpalShaftWidth / 2,0])
            {
                linear_extrude(height = gimpalShaftWidth)
                    circle(r = innerCurveRadius, center = true);
            }
        }

        cylinder(r = connectorDiameter / 2, h = gimpalShaftWidth);
    }
}

module DrawShaftClamps()
{
    mirror([0, 1, 0])
    translate([0, -clampHeight, 0])
        DrawShaftClamp();

    translate([0, -clampHeight, 0])
        DrawShaftClamp();
}

// TODO: Increase height to 11.?
module DrawRoundedStandoff(height = 7.2, standoffInnerRadius =  1.52)
{
    standoffOuterRadius = 2.85;

    difference()
    {
        cylinder(r = standoffOuterRadius, h = height);
        cylinder(r = standoffInnerRadius, h = height);
    }
}

module DrawBearingSeparator()
{
    difference()
    {
        cylinder(r = bearingSeparatorDiameter / 2 , h = bearingSeparatorHeight);
        
        linear_extrude (height = bearingSeparatorHeight)
            square([bodyConnectorSideWidth + 1.5, bodyConnectorSideWidth + 1.3], center = true);
    
        translate([0, bearingSeparatorDiameter, bearingSeparatorHeight] / 2)
            rotate(a = 90, v = [1, 0, 0])
                cylinder( r = bodyMountScrewHoleDiameter / 2, h = bearingSeparatorDiameter);
    }
}

module DrawUnoBody()
{
    translate([0, 0, -bodySideWidth / 2])
       DrawUnoSideLeft();

    translate([0, 0, bodySideWidth / 2])
        DrawUnoSide();
}

module DrawUnoSideLeft()
{
    translate([0, bodyHeight, 0])
        rotate(a = 180, v = [1,0,0])
            DrawUnoSide();
}

module DrawUnoSide()
{
    difference()
    {
        DrawBodySide();
        
        yOffset = (bodyHeight - (bodyConnectorSideWidth + 0.2)) / 2;
        translate([bodyMountScrewOffset, yOffset, 0])
            DrawBodyMountToBearing();
    }
    
}

module DrawBodySide()
{
    linear_extrude(height = slabThickness)
        square([bodySideLength, bodyHeight]);
}

module DrawBodyMountToBearing(bodyMountScrewHeadDiameter = bodyMountScrewHeadDiameter, bodyConnectorSideWidthOffset = bodyConnectorSideWidthOffset)
{
    translate([bodyConnectorSideWidth + bodyConnectorSideWidthOffset, bodyConnectorSideWidth + bodyConnectorSideWidthOffset, 0] / 2)
    {
        cylinder(r = bodyMountScrewHeadDiameter / 2, h = bodyMountScrewHeadHeight);
        translate([0, 0, bodyMountScrewHeadHeight])
            cylinder(r = bodyMountScrewHoleDiameter / 2, h = slabThickness - bodyMountScrewHeadHeight);

        translate([0, 0, slabThickness - bodyMountGuidingSquareHeight])
            linear_extrude(bodyMountGuidingSquareHeight + bodyConnectorSideWidthOffset)
                square(bodyConnectorSideWidth + bodyConnectorSideWidthOffset, center = true);
    }
}

module DrawBodyConnector(bodyConnectorShaftLength = bodyConnectorShaftLength, bodyConnectorDiameter = bodyConnectorDiameter, slabThickness = slabThickness,
bodyConnectorShaftScrewDiameter = bodyConnectorShaftScrewDiameter,bodyConnectorShaftScrewLength = bodyConnectorShaftScrewLength)
{
    difference()
    {
        
        translate([0,0,0])
        {
            cylinder(r = bodyConnectorDiameter / 2, h = bodyConnectorShaftEnd);
                translate([0, 0, bodyConnectorShaftEnd])
            difference()
            {
                    linear_extrude(bodyConnectorShaftLength)
                        square(bodyConnectorSideWidth, center = true);

                translate([0, bodyConnectorSideWidth / 2, bearingWidth + bearingSeparatorHeight / 2])
                    rotate(a = 90, v = [1, 0, 0])
                        cylinder( r = bodyMountScrewHoleDiameter / 2, h = bodyConnectorSideWidth);
            }
        }
        translate([0, 0, bodyConnectorShaftEnd + bodyConnectorShaftLength - bodyConnectorShaftScrewLength])
            cylinder(r = bodyConnectorShaftScrewDiameter / 2, h = bodyConnectorShaftScrewLength);
    }
}

module DrawBearingConnectorHole()
{
    translate([0, bearingInnerConnectorDiameter / 2, 0 ])
        cylinder(r = bearingInnerConnectorDiameter /2, h = slabHeight);
}

module DrawBearingHolder(bearingThickness = slabThickness, bearingDiamater = 22, bearingHeight = slabHeight)
{
    translate([0, bearingDiamater / 2 + bearingThickness, 0])
        difference()
        {
            bearingFullDiam = bearingDiamater + 2 * bearingThickness;
            
            cylinder(r = bearingDiamater / 2 + bearingThickness, h = bearingHeight);
            cylinder(r = bearingDiamater / 2, h = bearingHeight);
            translate([-bearingFullDiam/2, -wireHoleWidth / 2, bearingHeight - wireHoleHeight])
                cube([bearingFullDiam, wireHoleWidth, wireHoleHeight]);
            
        }
}

module DrawUpperAndRear()
{
    difference()
    {
        translate([0,0,0])
        {
            drawHollow(motorMount = false, centerMount = true);

            rotate_about_pt(-45, [0, 0, 1], [rearWheelTopLength + innerWidthAdj, innerWidthAdj, 0])
                drawHollow(matrix = [[0,rearWheelTopLength + innerWidthAdj],[innerWidthAdj, rearWheelTopLength + innerWidthAdj], [innerWidthAdj, rearWheelLength + 2*innerWidthAdj], [0, rearWheelLength + 2* innerWidthAdj]], motorMount = true);
            
            // Bearing
            translate([bearingXposition, -(innerCornerRadius + slabThickness), 0])
                DrawBearingHolder();
        }
        // 
        DrawScrewHole(screwDistanceFromFrontNose);
        DrawScrewHole(clampScrewDistanceFromFrontNose);
        DrawScrewHole(clampScrewDistanceFromFrontNose + clampScrewGap);
        translate([bearingXposition, 0.6, 0])
            DrawBearingConnectorHole();
    }
}

module DrawScrewHole(xPosition = screwDistanceFromFrontNose)
{
        // Front Screw
        translate([xPosition - (innerCornerRadius + slabThickness), 0, slabThickness + motorHeight / 4])
            rotate(a = 90, v = [1, 0, 0])
                cylinder(r = MotorScrewRadius, h = innerCornerRadius + slabThickness);
}

module rotate_about_pt(a, v, pt) {
    translate(pt)
        rotate(a,v)
            translate(-pt)
                children();   
}


//drawHinge();

module drawHinge(gapBetween = gapBetween, hingeThickness = slabThickness, hingeHeight = hingeHeightFromBase, roundedEdgeRadius = slabThickness)
{
    for (y = [0: 1])
    {
        translate([0, -2 * gapBetween * y, 0])
        difference()
        {
            hull()
            {
                // Draw top one (MotorScrewRadius )
                translate([0, 0, hingeHeightFromBase])
                    rotate(a = 90, v = [1, 0, 0])
                        cylinder(r = roundedEdgeRadius, h = hingeThickness);
                
                translate([-(hingeHeightFromBase + roundedEdgeRadius), 0, 0])
                    translate([0, 0, -hingeThickness])
                        rotate(a = 90, v = [1, 0, 0])
                            cylinder(r = roundedEdgeRadius, h = hingeThickness);
                
                
                translate([(hingeHeightFromBase + roundedEdgeRadius), 0, 0])
                    translate([0, 0, -hingeThickness])
                        rotate(a = 90, v = [1, 0, 0])
                            cylinder(r = roundedEdgeRadius, h = hingeThickness);
            }
        
            // Draw top one (MotorScrewRadius )
            translate([0, 0, hingeHeightFromBase])
                rotate(a = 90, v = [1, 0, 0])
                    cylinder(r = MotorScrewRadius, h = hingeThickness);
            
            xCube = hingeHeightFromBase * 2 + roundedEdgeRadius * 4;
            yCube = roundedEdgeRadius * 2;
            translate([-xCube / 2, -hingeThickness, -yCube])
                cube([xCube, hingeThickness, yCube ]);
        }
    }
}

module DrawMicroServo(servoWidth = 12.7, servoLength = 23, mountHoleRadius = 1, mountHoleDistance = 1, boltHoleDistance = 5.3, drawRect = true, height = height, centerY = 0, centerX = 0)
{
    totalY = 2*boltHoleDistance + servoWidth;
    totalX = 2*boltHoleDistance + servoLength;
    
    centerYlocal = centerY == 0 ? totalY: centerY;
    centerXlocal = centerX == 0 ? totalX: centerX;

    echo("centerYlocal: ", centerYlocal);
    translate([(centerXlocal - totalX), (centerYlocal - totalY), 0] / 2) // Center against another object 
    translate ([0, totalY, 0])
    rotate(a = -90, v = [0,0,1])
    translate([boltHoleDistance, boltHoleDistance , 0])
    {
        cube ([servoWidth, servoLength, height]);

        translate([(servoWidth - 5)/2, -2, 0])
            cube([5, 2, height]);

        translate([(servoWidth - 5)/2, servoLength, 0])
            cube([5, 2, height]);

        for(i = [0:1])
        {
            for(j = [0, 1])
            {
                translate([i * (servoWidth + boltHoleDistance) - boltHoleDistance / 2, j * (servoLength + boltHoleDistance) - boltHoleDistance / 2])
                    cylinder(r = 1.5, h = height);
            }
        }
    }
}

module drawL298N(centerX = 0, centerY = 0, screwRadius = 1.7)
{
    lengthXY = 37;

    localCenterX = centerX == 0 ? lengthXY : centerX;
    localCenterY = centerY == 0 ? lengthXY : centerY;

    translate([localCenterX - lengthXY, localCenterY - lengthXY, 0] / 2)
    for(x = [0:1])
    {
        for(y = [0:1])
        {
            translate([x * lengthXY, y * lengthXY, 0])
                cylinder(r = screwRadius, h = slabHeight);
        }
    }
}

module drawBodyLid(xDiff = 82, yDiff = bodyInnerWidth, offsetXY = 0.5, height = slabThickness, drawArduino = false, drawWireHole = true, drawWireHoleXRelPercPosition = 50, drawBatteryHolder = false, drawHinge = false, drawServo = false, drawL298N = false)
{
    difference()
    {
        echo("yDiff ", yDiff);
        
        cube([xDiff - offsetXY, yDiff - offsetXY, slabThickness]); //xDiff = 82 
        
        // Draw screw holes
        screwLength = 8;
        screwDistance = 66;
        
        // Draw spacer holes 
        spacerDistance = 2.5;
        
        startXPosition = (xDiff - offsetXY - screwDistance) / 2;

        for(y = [0: 1])
        for(x = [0: 1])
        {
            // Hinges
            translate([startXPosition + x * screwDistance, screwLength + y* (yDiff - offsetXY - screwLength), slabThickness / 2])
                rotate(a = 90, v = [1, 0, 0])
                    cylinder(r = 1.2, h = screwLength);
            
            // Spacers
            translate([spacerDistance + x * (xDiff - offsetXY - 2 * spacerDistance), spacerDistance + y * (yDiff - offsetXY - 2 * spacerDistance), 0])
                cylinder(r = 1.5, h = slabThickness);
        }

        if(drawL298N)
        {
            centerX = xDiff - offsetXY;
            centerY = yDiff - offsetXY;

            drawL298N(centerX = centerX, centerY = centerY);
        }

        if(drawServo)
        {
            rotate_about_pt(180, [0, 0, 1], [(xDiff - offsetXY)/2, (yDiff - offsetXY)/2, 0])
                DrawMicroServo(centerY = (yDiff - offsetXY), height = slabThickness,centerX =  (xDiff - offsetXY) * .45);
        }

        if(drawArduino)
        {
            arduinoXWidth = 55.8;
            arduinoYWidth = 50 + 1.5;
            arduinoPositionAdjustment = 8.14;

            //rotate_about_pt(180, [0, 0, 1], [(xDiff - offsetXY)/2, (yDiff - offsetXY)/2, 0])
            rotate_about_pt(180, [0, 0, 1], [(xDiff - offsetXY)/2, (yDiff - offsetXY)/2, 0])
                translate([(xDiff - offsetXY) - arduinoXWidth + arduinoPositionAdjustment , (yDiff - offsetXY) - arduinoYWidth, 0] / 2)
                    arduinoHolder();
        }

        if (drawBatteryHolder)
        {
            holderTotalHeight = battrHolderHeight + 2 * screwRadius;
            holderTotalWidth = 2 * (battrHolderHalfwidth + screwRadius);
            
            translate([xDiff - offsetXY - holderTotalHeight, yDiff - offsetXY - holderTotalWidth, 0] / 2)
                batteryholder();
        }
        
        if(drawWireHole)
        {
            wireHoleWidth = 12;
            wireHoleLength = 24;
            
            centerX = (xDiff - offsetXY) * drawWireHoleXRelPercPosition/100;
            centerY = (yDiff - offsetXY)/2;
            
            roundedHoleRotated(length = wireHoleLength, width = wireHoleWidth, centerPointX = centerX, centerPointY = centerY);
        }
    }
    
    if(drawHinge)
    {
        mirror([0, 0, 1])
        {
            hingeCenterPositionOnLid = 29.3;
            
            xPosition = hingeCenterPositionOnLid - ((2 * gapBetween - hingeThickness) / 2 + hingeThickness);
            translate([xPosition, (yDiff - offsetXY)/2, 0])
            rotate(a = 90, v = [0,0,1])
                drawHinge();
        }
    }
}

module batteryholder(battrHolderHeight = battrHolderHeight, battrHolderHalfwidth = battrHolderHalfwidth, height = slabHeight, screwRadius = screwRadius)
{
    for(i = [0:2])
    {
        for(j = [0, 1])
        translate([j * battrHolderHeight + screwRadius, i*battrHolderHalfwidth + screwRadius, 0])
            cylinder(r=screwRadius, h = height + 4);
    }
}

module drawHollow(matrix = [[0,0],[innerWidthAdj, innerWidthAdj], [innerWidthAdj, rearWheelTopLength + innerWidthAdj], [0, rearWheelTopLength + innerWidthAdj]], motorMount = true, centerMount = false, centerMountWidth = 12, hollowWidth = slabThickness + motorHeight / 2, drawWireSpace = true, isHollow = true, drawBodyMounts = false, drawBackMount = false, cutTop = false, drawArduino = false, drawLidHoles = false, drawWireHole = false, cutHole = true, drawL298N = false)
{
    
    // Set variables
    y1 = matrix[3][0];
    y2 = matrix[2][0];
    x1 = matrix[2][0];
    x2 = matrix[3][1];

    echo("y1 ", y1);
    echo("y2 ", y2);
    echo("x1 ", x1);
    echo("x2 ", x2);
    yCenter = (y2  - y1) / 2;
    innerHollowWidth = isHollow ? hollowWidth  : hollowWidth - 2 *slabThickness;
    
    xDiff = x2 - x1;
    yDiff = innerHollowWidth;

    echo("xDiff ", xDiff);
    
    difference()
    {
        hull()
        {
            for(i = [0: len(matrix) - 1])
            {
                v = matrix[i];
                echo(v);
                translate([v[1], v[0], 0])
                    cylinder(r = innerCornerRadius + slabThickness, h = hollowWidth);
            }
        }
        
        echo("innerHollowWidth : ", innerHollowWidth);
        echo("hollowWidth: ", hollowWidth);
        echo("slabThickness: ", slabThickness);

        translate([0, 0, slabThickness])
        hull()
        {
            for(i = [0: len(matrix) - 1])
            {
                v = matrix[i];
                echo(v);
                translate([v[1], v[0], 0])
                    cylinder(r = innerCornerRadius, h = innerHollowWidth);
            }
        }
        
        if(cutHole)
        {
            totalHeight = x1 + 2 * (slabThickness + innerCornerRadius);
        
            translate([x1, -(slabThickness + innerCornerRadius), slabThickness])
                cube([xDiff, totalHeight, yDiff]);
        }

        if(drawWireHole)
        {
            // TODO: Replace with wirehole routine
            translate([xDiff / 2 + x1 , 0, hollowWidth / 2] )
                rotate(a = 90, v = [1, 0, 0])
                    cylinder(r = 9, h = slabThickness * 2);
        }

        if (drawLidHoles)
        {
            for(l = [0:1])
            {
                translate([x1 + lidScrewOffset + l*(xDiff - 2 * lidScrewOffset), y2 + innerCornerRadius + slabThickness / 2, 0])
                {
                    cylinder(r = bodyMountScrewHeadDiameter / 2, h = slabThickness / 2);
                    translate([0, 0, slabThickness / 2])
                        cylinder(r = 1.2, h = innerHollowWidth + slabThickness);
                    translate([0, 0, slabThickness * 3 / 2 + innerHollowWidth])
                        cylinder(r = bodyMountScrewHeadDiameter / 2, h = slabThickness / 2);
                }

                translate([x1 + lidScrewOffset + l*(xDiff - 2 * lidScrewOffset), -(innerCornerRadius + slabThickness / 2), 0])
                {
                    cylinder(r = bodyMountScrewHeadDiameter / 2, h = slabThickness / 2);
                    translate([0, 0, slabThickness / 2])
                        cylinder(r = 1.2, h = innerHollowWidth + slabThickness);
                    translate([0, 0, slabThickness * 3 / 2 + innerHollowWidth])
                        cylinder(r = bodyMountScrewHeadDiameter / 2, h = slabThickness / 2);
                }
            }
        }
        
        //Draw back Mount
        if (drawBackMount)
        {
            translate([x2, yCenter, hollowWidth / 2])
                rotate(a = 90, v = [0, 1, 0])
                    cylinder(r = 1.5, h = 20);
        }

        centerOffset = (bodyConnectorSideWidth + bodyConnectorSideWidthOffset) / 2;
        if(drawBodyMounts)
        {
            // Correct
            translate([bodyMountDistanceFromNose - (innerCornerRadius + slabThickness), yCenter, hollowWidth - slabThickness])
                translate([-centerOffset, -centerOffset, 0])
                    DrawBodyMountToBearing();
            
            // Wrong
            translate([bodyMountDistanceFromNose - (innerCornerRadius + slabThickness), yCenter, .01])
                translate([centerOffset, -centerOffset, slabThickness])
                rotate(a = 180, v = [0, 1, 0])
                    DrawBodyMountToBearing();
        }
        
        // Draw wire space
        if(drawWireSpace)
        {
            translate([-(innerCornerRadius + slabThickness) , yCenter - wireHoleWidth / 2, slabHeight - wireHoleHeight])
                cube([x2 + 2 * (innerCornerRadius + slabThickness), wireHoleWidth, wireHoleHeight]);
        }
        
        if(motorMount)
        {

            maxX = x2 + innerCornerRadius + slabThickness;
            
            translate([maxX - MotorScrewY - slabThickness, (yCenter) + MotorScrewGap / 2 , 0])
                //cylinder(r = 1.7, h = slabThickness + motorHeight / 2);
                cylinder(r = 1.7, h = hollowWidth);
        
            translate([maxX - MotorScrewY - slabThickness, (yCenter) - MotorScrewGap / 2 , 0])
                // cylinder(r = 1.7, h = slabThickness + motorHeight / 2);
                cylinder(r = 1.7, h = hollowWidth);
        
            echo("maxX: ", maxX);
            hull()
            {
                translate([maxX - motorShaftGapY - motorShaftGapRadius, yCenter, 0])
                    cylinder (h = hollowWidth, r = motorShaftGapRadius);
                translate([maxX - motorShaftGapY + motorShaftGapRadius - motorShaftGapLength, yCenter, 0])
                    cylinder (h = hollowWidth, r = motorShaftGapRadius);
            }
        }
        
        if(centerMount)
        {

            maxX = x2 + innerCornerRadius + slabThickness;
            
            translate([maxX / 2, (yCenter) + MotorScrewGap / 2 , 0])
                cylinder(r = 1.7, h = hollowWidth);
        
            translate([maxX / 2, (yCenter) - MotorScrewGap / 2 , 0])
                cylinder(r = 1.7, h = hollowWidth);
        
            echo("maxX: ", maxX);
            hull()
            {
                translate([maxX / 2 - centerMountWidth / 2, yCenter, 0])
                    cylinder (h = hollowWidth, r = motorShaftGapRadius);
                translate([maxX / 2 + centerMountWidth / 2, yCenter, 0])
                    cylinder (h = hollowWidth, r = motorShaftGapRadius);
            }
        }
    }
}

module roundedHole(length = 24, width = 12, height = 5, centerPointX = 0, centerPointY = 0)
{
    distance = (length - width) / 2;
    translate([centerPointX, centerPointY, 0] )
        hull()
            for(x = [0:1])
            {
                translate([distance * (2 * x - 1), 0, 0])
                    cylinder(r = width / 2, h = height);
            }
}

module roundedHoleRotated(length = 24, width = 12, height = 5, centerPointX = 0, centerPointY = 0)
{
    distance = (length - width) / 2;
    translate([centerPointX, centerPointY, 0] )
        hull()
            for(y = [0:1])
            {
                translate([0, distance * (2 * y - 1), 0])
                    cylinder(r = width / 2, h = height);
            }
}

module arduinoHolder()
{
    translate([55.8 + 1.5, 50 + 1.5, 0])
        rotate(a = 180, v = [0, 0, 1])
        {
            drawHoleXY(x = 3, y = 45.2);
            drawHoleXY(x = 3, y = 17.1);
            drawHoleXY(x = 55.8, y = 50); 
            drawHoleXY(x = 54.1, y = 1.8);
        }
}

module drawHoleXY(x, y, height = slabThickness * 2)
{
    translate([x, y, 0])
        cylinder(r = 1.5, h = height);
}

module DrawHinges()
{
    rotate(a = 90,v = [1, 0, 0])
    {
        hingeSide();
        translate([0, 0, motorHeight + comfortGap + 3 * slabThickness])
            hingeSide();
            
        translate([slabThickness, 0, slabThickness])
            hingeMountPlate(screwDistanceFromEdge = slabThickness + 4.8);
    }
}

module hingeSide()
{
    difference()
    {
        union()
        {
            translate([innerWidth / 2, hingeHeight - innerWidth / 2, 0])
                cylinder(r = innerWidth / 2, h = slabThickness);
            
            RoundedSlab(slabHeight = slabThickness, innerLength = hingeHeight - innerWidth / 2 + innerCornerRadius);
        }
        translate([innerWidth / 2, hingeHeight - innerWidth / 2, 0])
            cylinder(r = 2.1, h = slabThickness);
    }
}

module hingeMountPlate(comfortGap = 2, screwDistanceFromEdge = 4.8)
{
    x = innerWidth - 2 * slabThickness;
    z = motorHeight + 2 * slabThickness + comfortGap;
    screwDistance = z - 2 * screwDistanceFromEdge;

    difference()
    {
        cube([x, slabThickness, z]);
        for ( i = [0 :1])
            translate([x / 2, slabThickness, i * screwDistance + screwDistanceFromEdge])
                rotate(a = 90, v = [1, 0, 0])
                    cylinder(r = 1.7, h = slabThickness);
    }
}

module FrontWheelHubs()
{
    difference()
    {
        translate([-28, 26, 0]) // TODO: Explain the magic numbers
            JointPiece();

        translate([-(totalHypotenus + totalWidth + 0.3) * sin(45), 0, 0])
            rotate(a = -45, v = [0, 0, 1])
                RoundedWalls(solid = true);

        translate([(totalHypotenus + totalWidth + 0.3) * sin(45), 0, 0])
            translate([-totalWidth * sin(45), -totalWidth * sin(45), 0])
                rotate(a = 45, v = [0, 0, 1])
                    RoundedWalls(solid = true);
    }

    translate([-(totalHypotenus + totalWidth) * sin(45), 0, 0])
        rotate(a = -45, v = [0, 0, 1])
            MotorHolder();

    translate([(totalHypotenus + totalWidth) * sin(45), 0, 0])
        translate([-totalWidth * sin(45), -totalWidth * sin(45), 0])
            rotate(a = 45, v = [0, 0, 1])
                MotorHolder();
}

module JointPiece()
{
    jointWidth = 56;
    screwOuter_r = 4;
    screwInner_r = 2.1;
    
    difference()
    {
        cube([jointWidth, jointHeight , slabHeight]);
        translate([-slabThickness, slabThickness, slabThickness])
            cube([jointWidth + slabThickness, jointHeight - 2 * slabThickness, slabHeight - slabThickness]);

        translate([jointWidth, jointHeight , 0] / 2)
            cylinder(r = screwInner_r, h = slabHeight);
        translate([(jointWidth - wireHoleWidth) / 2, 0, wireHoleXPos + slabThickness])
            cube([wireHoleWidth, innerLength + 2 * slabThickness,slabHeight - wireHoleXPos - slabThickness]);
        
    }
    
    difference()
    {
        translate([jointWidth, jointHeight , 0] / 2)
            cylinder(r = screwOuter_r, h = slabHeight);
        translate([jointWidth, jointHeight , 0] / 2)
            cylinder(r = screwInner_r, h = slabHeight);
    }
}


module MotorHolder()
{
    difference()
    {
        union()
        {
            RoundedWalls();
            translate([slabThickness , slabThickness , 0])
                motorHolderBase();
        }

        translate([motorShaftGapX, motorShaftGapY, 0])
            RoundedSlab(innerWidth  = motorShaftGapWidth , innerLength = motorShaftGapLength, innerCornerRadius = motorShaftGapRadius, slabHeight = slabThickness);
        translate([(innerWidth + 2 * slabThickness  - wireHoleWidth) / 2, 0, wireHoleXPos + slabThickness])
            cube([wireHoleWidth, innerLength + 2 * slabThickness,slabHeight - wireHoleXPos - slabThickness]);
    }
}

module motorHolderBase(innerWidth  = innerWidth, innerLength = innerLength, innerCornerRadius = innerCornerRadius, slabHeight = slabHeight, slabThickness = slabThickness, MotorScrewY = MotorScrewY, MotorScrewRadius = MotorScrewRadius, MotorScrewGap = MotorScrewGap)
{
    centerX = (innerWidth - (MotorScrewGap + 2 * MotorScrewRadius)) / 2;
    echo("innerWidth: ", innerWidth);
    echo("MotorScrewGap: ", MotorScrewGap);
    echo("MotorScrewRadius: ", MotorScrewRadius);
    echo("centerX: ", centerX);
    difference()
    {
        RoundedSlab(slabHeight = slabThickness);

        translate([centerX, 0, 0])
        for (x = [0: 1])
        {
            translate([x * MotorScrewGap + MotorScrewRadius, MotorScrewY, 0])
                cylinder(r = MotorScrewRadius, h  = slabThickness + 3);
        }
    }
}

module RoundedWalls(innerWidth  = innerWidth, innerLength = innerLength, innerCornerRadius = innerCornerRadius, slabHeight = slabHeight, slabThickness = slabThickness, solid = false)
{
    difference()
    {
        RoundedSlab(innerCornerRadius = innerCornerRadius + slabThickness , innerWidth  = innerWidth + slabThickness  * 2, innerLength = innerLength + slabThickness * 2);

        if(!solid)
        {
            translate([slabThickness , slabThickness , 0])
                RoundedSlab();
        }
    }
}

module RoundedSlab(innerWidth  = innerWidth, innerLength = innerLength, innerCornerRadius = innerCornerRadius, slabHeight = slabHeight)
{
    hull()
    {
        linear_extrude(height = slabHeight)
        translate([innerCornerRadius, innerCornerRadius, 0])
        {
            for(y = [0:1])
            {
                for(x = [0:1])
                {
                    translate([x * (innerWidth - 2 * innerCornerRadius), y * (innerLength - 2 * innerCornerRadius), 0])
                        circle(r = innerCornerRadius);
                }
            }
        }
    }
}
