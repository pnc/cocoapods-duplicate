Navigate to `Example` and run `pod install`.

Output:

    RuntimeError - [Xcodeproj] Generated duplicate UUIDs:
    
    PBXFileReference -- /targets/buildConfigurationList:buildConfigurations:|,|,defaultConfigurationIsVisible:0,defaultConfigurationName:Release,displayName:ConfigurationList,isa:XCConfigurationList,,buildPhases:buildActionMask:|,displayName:|,files:|,isa:|,runOnlyForDeploymentPostprocessing:|,,buildActionMask:|,displayName:|,files:|,isa:|,runOnlyForDeploymentPostprocessing:|,,buildActionMask:|,displayName:|,files:|,isa:|,runOnlyForDeploymentPostprocessing:|,,buildActionMask:|,displayName:|,files:|,isa:|,runOnlyForDeploymentPostprocessing:|,,buildRules:,dependencies:displayName:|,isa:|,name:|,target:|,targetProxy:|,,displayName:dupe,isa:PBXNativeTarget,name:dupe,productName:dupe,productReference:displayName:dupe.framework,explicitFileType:wrapper.framework,includeInIndex:0,isa:PBXFileReference,name:dupe.framework,path:dupe.framework,sourceTree:BUILT_PRODUCTS_DIR,,productType:com.apple.product-type.framework,/buildPhases/buildActionMask:2147483647,displayName:HeadersBuildPhase,files:displayName:|,fileRef:|,isa:|,settings:|,,displayName:|,fileRef:|,isa:|,settings:|,,displayName:|,fileRef:|,isa:|,settings:|,,isa:PBXHeadersBuildPhase,runOnlyForDeploymentPostprocessing:0,/files/displayName:ReplaceMe.h,fileRef:displayName:ReplaceMe.h,includeInIndex:1,isa:PBXFileReference,lastKnownFileType:sourcecode.c.h,path:ReplaceMe.h,sourceTree:<group>,,isa:PBXBuildFile,settings:ATTRIBUTES:|,,/fileRef
    PBXBuildFile -- /targets/buildConfigurationList:buildConfigurations:|,|,defaultConfigurationIsVisible:0,defaultConfigurationName:Release,displayName:ConfigurationList,isa:XCConfigurationList,,buildPhases:buildActionMask:|,displayName:|,files:|,isa:|,runOnlyForDeploymentPostprocessing:|,,buildActionMask:|,displayName:|,files:|,isa:|,runOnlyForDeploymentPostprocessing:|,,buildActionMask:|,displayName:|,files:|,isa:|,runOnlyForDeploymentPostprocessing:|,,buildActionMask:|,displayName:|,files:|,isa:|,runOnlyForDeploymentPostprocessing:|,,buildRules:,dependencies:displayName:|,isa:|,name:|,target:|,targetProxy:|,,displayName:dupe,isa:PBXNativeTarget,name:dupe,productName:dupe,productReference:displayName:dupe.framework,explicitFileType:wrapper.framework,includeInIndex:0,isa:PBXFileReference,name:dupe.framework,path:dupe.framework,sourceTree:BUILT_PRODUCTS_DIR,,productType:com.apple.product-type.framework,/buildPhases/buildActionMask:2147483647,displayName:HeadersBuildPhase,files:displayName:|,fileRef:|,isa:|,settings:|,,displayName:|,fileRef:|,isa:|,settings:|,,displayName:|,fileRef:|,isa:|,settings:|,,isa:PBXHeadersBuildPhase,runOnlyForDeploymentPostprocessing:0,/files/displayName:ReplaceMe.h,fileRef:displayName:ReplaceMe.h,includeInIndex:1,isa:PBXFileReference,lastKnownFileType:sourcecode.c.h,path:ReplaceMe.h,sourceTree:<group>,,isa:PBXBuildFile,settings:ATTRIBUTES:|,,
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/xcodeproj-0.26.2/lib/xcodeproj/project/uuid_generator.rb:24:in `verify_no_duplicates!'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/xcodeproj-0.26.2/lib/xcodeproj/project/uuid_generator.rb:14:in `generate!'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/xcodeproj-0.26.2/lib/xcodeproj/project.rb:337:in `predictabilize_uuids'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/installer.rb:653:in `block in write_pod_project'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/user_interface.rb:140:in `message'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/installer.rb:648:in `write_pod_project'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/installer.rb:155:in `block in generate_pods_project'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/user_interface.rb:59:in `section'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/installer.rb:149:in `generate_pods_project'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/installer.rb:109:in `install!'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/command/project.rb:71:in `run_install_with_update'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/command/project.rb:101:in `run'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/claide-0.9.1/lib/claide/command.rb:312:in `run'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/lib/cocoapods/command.rb:48:in `run'
    /Users/eleos/.rbenv/versions/2.2.2/lib/ruby/gems/2.2.0/gems/cocoapods-0.38.1/bin/pod:44:in `<top (required)>'
    /Users/eleos/.rbenv/versions/2.2.2/bin/pod:23:in `load'
    /Users/eleos/.rbenv/versions/2.2.2/bin/pod:23:in `<main>'

You can apply this patch to `uuid_generator.rb` in the xcodeproj gem to get a more helpful error:

    @@ -66,6 +68,11 @@
               next unless path = @paths_by_object[object]
               uuid = uuid_for_path(path)
               object.instance_variable_set(:@uuid, uuid)
    +          if @new_objects_by_uuid.has_key?(uuid)
    +            old_object = @new_objects_by_uuid[uuid]
    +            byebug
    +            raise "Duplicate for #{uuid}: \n#{object.inspect}\n vs \n#{old_object.inspect}"
    +          end
               @new_objects_by_uuid[uuid] = object
             end
           end
