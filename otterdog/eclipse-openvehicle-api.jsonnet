local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.openvehicle-api', 'eclipse-openvehicle-api') {
  settings+: {
    description: "",
    name: "Eclipse Open Vehicle API",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('openvehicle-api') {
      description: "Project API",
    },
    orgs.newRepo('openvehicle-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Project website",
      web_commit_signoff_required: false,
    },
  ],
} + {
  # snippet added due to 'https://github.com/eclipsefdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}