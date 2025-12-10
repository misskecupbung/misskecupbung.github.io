// get the ninja-keys element
const ninja = document.querySelector('ninja-keys');

// add the home and posts menu items
ninja.data = [{
    id: "nav-about",
    title: "About",
    section: "Navigation",
    handler: () => {
      window.location.href = "/";
    },
  },{id: "nav-blog",
          title: "Blog",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/blog/";
          },
        },{id: "nav-",
          title: "",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/talks/";
          },
        },{id: "nav-repositories",
          title: "Repositories",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/repositories/";
          },
        },{id: "nav-cv",
          title: "CV",
          description: "Senior Cloud &amp; DevOps Engineer with 6+ years of experience in AWS, Azure, GCP. AWS Container Hero and Google Developer Expert.",
          section: "Navigation",
          handler: () => {
            window.location.href = "/cv/";
          },
        },{id: "nav-certifications",
          title: "Certifications",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/certifications/";
          },
        },{id: "nav-gallery",
          title: "Gallery",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/gallery/";
          },
        },{id: "post-aws-summit-singapore-2024-it-was-an-awsome-event",
        
          title: 'AWS Summit Singapore 2024: It was An AWSome Event! <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Hi all! I hope that you, wherever now, are doing well and happy as well. I would like to share about my experience at the AWS Summit Singapore two weeks ago, on May 7 2024 that I attended and spoke at. First, honestly, I didn&amp;#8217;t expect to have the opportunity to speak at the event, [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2024/05/22/aws-summit-singapore-2024-it-was-an-awsome-event/", "_blank");
          
        },
      },{id: "post-migrasi-database-di-mysql-on-premise-ke-cloud-sql-menggunakan-database-migration-service",
        
          title: 'Migrasi Database di MySQL On-Premise ke Cloud SQL menggunakan Database Migration Service <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "",
        section: "Posts",
        handler: () => {
          
            window.open("https://medium.com/google-cloud-indonesia/migrasi-database-di-mysql-on-premise-menggunakan-database-migration-service-ke-cloud-sql-c5547f9baebd?source=rss-4dd39a6b908a------2", "_blank");
          
        },
      },{id: "post-google-cloud-migrasi-database-di-mysql-on-premise-ke-cloud-sql-menggunakan-database-migration-service",
        
          title: 'Google Cloud: Migrasi Database di MySQL On-Premise ke Cloud SQL menggunakan Database Migration... <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Halo semua! Selamat siang! Apa kabar? Jumpa lagi di Jurnal saya ya! Sudah lama tidak update dan disini saya ingin memulai tahun 2024 dengan topik&amp;#160;migrasi database MySQL di on-premise ke Cloud SQL menggunakan Database Migration Service. Yup! Mengapa harus menggunakan Database Migration Service? Sebenarnya bisa saja kita menggunakan tool semacam&amp;#160;mysqldump&amp;#160;untuk&amp;#160;dump&amp;#160;database di on-premise dan&amp;#160;restore&amp;#160;di Cloud SQL. [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2024/01/17/google-cloud-migrasi-database-di-mysql-on-premise-ke-cloud-sql-menggunakan-database-migration-service/", "_blank");
          
        },
      },{id: "post-aws-deploy-a-simple-application-with-custom-domain-using-aws-app-runner",
        
          title: 'AWS: Deploy a Simple Application with Custom Domain using AWS App Runner <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Hi all! Good night and I hope that you are doing well. In this journal, I would like to share with you about AWS App Runner. Specifically, I will explain how to deploy a simple application on there and set it so it will use a custom domain. For the domain, I will use Amazon [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2023/06/16/aws-deploy-a-simple-application-with-custom-domain-using-aws-app-runner/", "_blank");
          
        },
      },{id: "post-aws-cara-mendaftarkan-domain-baru-melalui-layanan-amazon-route-53",
        
          title: 'AWS: Cara Mendaftarkan Domain Baru Melalui Layanan Amazon Route 53 <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Halo semua! Apa kabar? semoga baik-baik saja ya semua ^^ sudah lama rasanya saya tidak menulis dan akan dicoba rutinkan kembali. Semoga terlaksana ya dan tidak hanya wacana ya 😀 Pada tulisan ini saya ingin menjelaskan bagaimana mendaftarkan domain baru melalui layanan di AWS, yaitu Amazon Route 53. Apa keuntungannya? Sifatnya yang centralized, dimana hanya [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2023/06/02/aws-cara-mendaftarkan-domain-baru-melalui-layanan-amazon-route-53/", "_blank");
          
        },
      },{id: "post-aws-cloud-stop-an-ec2-instance-using-aws-lambda-when-the-budget-amount-is-reached",
        
          title: 'AWS Cloud: Stop an EC2 Instance using AWS Lambda when the Budget Amount... <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Hi all! Good night and happy holiday! Here I would like to share with all of you about something an interesting case study that maybe you&amp;#8217;ve done or come across soon. Imagine the Developer Team in your company is still doing Proof-of-Concept related to a specific project for the user, and the user is strict [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2023/01/24/aws-cloud-stop-an-ec2-instance-using-aws-lambda-when-the-budget-amount-is-reached/", "_blank");
          
        },
      },{id: "post-my-journey-roadtogde-mentorship-program",
        
          title: 'My Journey: #RoadToGDE Mentorship Program <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Hi all! How are you? I hope that you all good and healthy. By end of this year, I just want to share something great experience I&amp;#8217;ve done from September until December 2022. Yup #RoadToGDE Mentorship Program. That is an incredible journey, I thought. As long as 7 weeks, we as a mentee got opportunities [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2022/12/31/my-journey-roadtogde-mentorship-program/", "_blank");
          
        },
      },{id: "post-google-cloud-backup-and-restore-our-gke-workloads-using-backup-for-gke",
        
          title: 'Google Cloud: Backup and Restore Our GKE Workloads using Backup for GKE <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Hi all! I hope that you are doing well, safe and healthy! In this journal, I would like to share and explain a case study related to one of the great features of Google Kubernetes Engine (GKE). Yup, it is a Backup for GKE. As the name suggests, this feature is intended to back up [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2022/10/07/google-cloud-backup-and-restore-strategy-on-google-kubernetes-engine-gke/", "_blank");
          
        },
      },{id: "post-google-cloud-backup-and-restore-our-gke-workloads-using-velero",
        
          title: 'Google Cloud: Backup and Restore Our GKE Workloads using Velero <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Hi all! I hope that you are doing well. In this journal, I will explain the backup and restore strategy for Kubernetes using Velero, specifically in Google Kubernetes Engine (GKE). As you may know, Velero is one of the great open-source tools which can be used to back up and restore (including migrate and replicate) [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2022/10/07/google-cloud-backup-and-restore-our-gke-workloads-using-velero/", "_blank");
          
        },
      },{id: "post-google-cloud-gke-upgrade-using-blue-green-strategy",
        
          title: 'Google Cloud: GKE Upgrade using Blue-Green Strategy <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Hi all! I hope that your day is good enough. In this journal, I would like to explain about Google Kubernetes (GKE) upgrade, specifically using Blue-Green Strategy. By default, GKE offers an automatic upgrade feature to our existing GKE cluster. We just have to make sure auto-upgrade is enabled, with a bit configuration, and the [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2022/10/06/google-cloud-gke-upgrade-using-blue-green-strategy/", "_blank");
          
        },
      },{id: "post-google-cloud-deploying-a-static-web-application-to-google-cloud-storage-bucket-with-https-load-balancer",
        
          title: 'Google Cloud: Deploying a Static Web Application to Google Cloud Storage Bucket with... <svg width="1.2rem" height="1.2rem" top=".5rem" viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg"><path d="M17 13.5v6H5v-12h6m3-3h6v6m0-6-9 9" class="icon_svg-stroke" stroke="#999" stroke-width="1.5" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg>',
        
        description: "Hi all! I hope that you are doing well, safe, and healthy! In this journal, I would like to share how to deploy a static web application using the Google Cloud Storage bucket for hosting with HTTPS Load Balancer. So it will be safely accessible from outside. What makes it different from static web hosted [&amp;#8230;]",
        section: "Posts",
        handler: () => {
          
            window.open("https://misskecupbung.wordpress.com/2022/09/22/google-cloud-deploying-a-static-web-application-to-google-cloud-storage-bucket-with-https-load-balancer/", "_blank");
          
        },
      },{
        id: 'social-blogger',
        title: 'Blogger',
        section: 'Socials',
        handler: () => {
          window.open("https://misskecupbung.wordpress.com", "_blank");
        },
      },{
        id: 'social-cv',
        title: 'CV',
        section: 'Socials',
        handler: () => {
          window.open("/assets/pdf/ananda_cv.pdf", "_blank");
        },
      },{
        id: 'social-email',
        title: 'email',
        section: 'Socials',
        handler: () => {
          window.open("mailto:%61%6E%61%6E%64%61.%64%77%69%72%61%68%6D%61%77%61%74%69%33%31%33@%67%6D%61%69%6C.%63%6F%6D", "_blank");
        },
      },{
        id: 'social-facebook',
        title: 'Facebook',
        section: 'Socials',
        handler: () => {
          window.open("https://facebook.com/misskecupbung", "_blank");
        },
      },{
        id: 'social-github',
        title: 'GitHub',
        section: 'Socials',
        handler: () => {
          window.open("https://github.com/misskecupbung", "_blank");
        },
      },{
        id: 'social-linkedin',
        title: 'LinkedIn',
        section: 'Socials',
        handler: () => {
          window.open("https://www.linkedin.com/in/anandadwir", "_blank");
        },
      },{
        id: 'social-x',
        title: 'X',
        section: 'Socials',
        handler: () => {
          window.open("https://twitter.com/misskecupbung", "_blank");
        },
      },{
      id: 'light-theme',
      title: 'Change theme to light',
      description: 'Change the theme of the site to Light',
      section: 'Theme',
      handler: () => {
        setThemeSetting("light");
      },
    },
    {
      id: 'dark-theme',
      title: 'Change theme to dark',
      description: 'Change the theme of the site to Dark',
      section: 'Theme',
      handler: () => {
        setThemeSetting("dark");
      },
    },
    {
      id: 'system-theme',
      title: 'Use system default theme',
      description: 'Change the theme of the site to System Default',
      section: 'Theme',
      handler: () => {
        setThemeSetting("system");
      },
    },];
