////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package comps {

    import flash.display.DisplayObject;
    import flash.xml.*;
    
    import mx.controls.CheckBox;
    import mx.controls.Tree;
    import mx.controls.listClasses.*;
    import mx.controls.treeClasses.*;
    import mx.core.IDataRenderer;
 

    public class MyCheckItemRendererUpdated extends TreeItemRenderer
    {

        protected var myCheckBox:CheckBox;
        private var listOwner:Tree;
        private var folderCbX:uint = 32;
        private var leafCbX:uint = 40;
        private var margin:uint = 15;
       
        override protected function createChildren():void
        {
               super.createChildren();
                
               myCheckBox = new CheckBox();
               addChild(myCheckBox);
   
        }   
 
        override public function set data(value:Object):void
        {
           
            super.data = value;
            
            if(value != null)
            {
            	
                if(TreeListData(super.listData).hasChildren)
		{
	            myCheckBox.visible = false;
                    myCheckBox.includeInLayout = false; 
                }
                else
		{
		    myCheckBox.visible = true;
		    myCheckBox.includeInLayout = true; 
                }
                if(value.@selected == "true")
                {
                    myCheckBox.selected = true;
                }
		else
                {
                    myCheckBox.selected = false;
                }                
            }
        }
          
       override protected function commitProperties():void
       {
           super.commitProperties();
                        
           if (icon)
           {
               if(!TreeListData(listData).hasChildren)
               {
                   removeChild(DisplayObject(icon));
                   icon = null;
               }
           }
                              
      }
     
      override protected function updateDisplayList(unscaledWidth:Number,unscaledHeight:Number):void
      {       
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            
            label.y = 0;
            
            if(super.listData)
            {
                myCheckBox.x = (TreeListData(listData).hasChildren) ? folderCbX : leafCbX;
		myCheckBox.y = 0;
		myCheckBox.setActualSize(8, myCheckBox.measuredHeight);
                if(! TreeListData(listData).hasChildren)
                {
                    super.label.x = myCheckBox.x + myCheckBox.width + margin;
                }
            }
        }
    }
}