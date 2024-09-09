package com.example.demo;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class SitemeshConfig extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder)
	{
	 
        builder.addDecoratorPath("*", "/default.jsp");
		
		//builder.addDecoratorPath("/admin/*", "/views/common/admin.jsp");
		
		// 제외할 폴더와 문서
		//builder.addExcludedPath("/test/*");
        builder.addDecoratorPath("/admin/*", "/addefault.jsp");
        
		
		
        super.applyCustomConfiguration(builder);
        
	}
}
