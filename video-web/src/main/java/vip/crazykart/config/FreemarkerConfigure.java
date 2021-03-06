package vip.crazykart.config;

import com.kangyonggan.freemarker.BlockDirective;
import com.kangyonggan.freemarker.ExtendsDirective;
import com.kangyonggan.freemarker.OverrideDirective;
import com.kangyonggan.freemarker.SuperDirective;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import vip.crazykart.freemarker.DictTag;
import vip.crazykart.freemarker.EnumTag;

import javax.annotation.PostConstruct;

/**
 * @author kangyonggan
 * @since 8/6/18
 */
@Configuration
public class FreemarkerConfigure {

    @Autowired
    freemarker.template.Configuration configuration;

    @Value("${app.name}")
    private String appName;

    @Autowired
    private DictTag dictTag;

    @Autowired
    private EnumTag enumTag;

    @PostConstruct
    public void setSharedVariable() throws TemplateModelException {
        configuration.setSharedVariable("block", new BlockDirective());
        configuration.setSharedVariable("override", new OverrideDirective());
        configuration.setSharedVariable("extends", new ExtendsDirective());
        configuration.setSharedVariable("super", new SuperDirective());

        configuration.setSharedVariable("appName", appName);
        configuration.setSharedVariable("dict", dictTag);
        configuration.setSharedVariable("enum", enumTag);
    }

}
